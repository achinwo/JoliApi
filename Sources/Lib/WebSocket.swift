//
//  File.swift
//  
//
//  Created by Anthony Chinwo on 01/11/2019.
//

import Foundation
import Promises


struct WebSocketMessage: Encodable {
    let topic: String
    let body: [String: String] = [:]
    let headers: HttpMethod.Headers
}

extension WebSocketMessage {
    
    func jsonString() -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = .prettyPrinted
        let jsonData = try! encoder.encode(self)
        
        return  String(data: jsonData, encoding: .utf8)!
    }
    
}

public enum ConnectionState: Equatable {
    case connected
    case reconnecting(Int)
    case stopped
    
    func lost() -> Self {
        switch self {
        case .connected:
            return .reconnecting(0)
        default:
            return self
        }
    }
    
    func established() -> Self {
        switch self {
        case .reconnecting(_):
            return .connected
        default:
            return self
        }
    }
    
    public var isConnected: Bool {
        switch self {
        case .connected:
            return true
        default:
            return false
        }
    }
}

public enum WebSocketError: Error {
    case sendFailed(String)
}

public class WebSocketClient: HttpsHook {
    
    public enum MessageTopic {
        case topic(String)
        case subscribe(String)
        
        var stringValue: String {
            switch self {
            case .topic(let topicName):
                return "/\(topicName)"
            case .subscribe(let subject):
                return "/subscribe?subject=\(subject)"
            }
        }
    }
    
    public typealias MessageCallback = (Result<URLSessionWebSocketTask.Message, Error>) -> Void
    public typealias ResponseCallback = (Response?, Error?) throws -> Void
    
    public typealias SubscriptionArguments = (callbacks: [ResponseCallback], message: URLSessionWebSocketTask.Message)
    
    var session: URLSession!
    var task: URLSessionWebSocketTask?
    
    public var messageCallbacks: [String: SubscriptionArguments] = [:]
    
    
    public var connectionHandler: ((ConnectionState) -> Void)?
    
    public var connectionState = ConnectionState.stopped {
        didSet {
            self.connectionHandler?(connectionState)
        }
    }

    public var  url: URL!
    //var queue: OperationQueue = DispatchQueue.global(qos: .background)
    //public var subjects: Set<String> = []
    
    public init(url: URL, headers: HttpMethod.Headers = [:], trustedHosts: [String] = []) {
        super.init(trustedHosts: trustedHosts)
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = config.httpAdditionalHeaders ?? [:]
        config.httpAdditionalHeaders!.merge(headers) { $1 }
        
        self.session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        
        self.url = url
    }
    
    private func addSubscription(_ subject: String, message: URLSessionWebSocketTask.Message, callback: @escaping ResponseCallback) {
        var sub = self.messageCallbacks[subject] ?? (callbacks: [], message: message)
        sub.callbacks.append(callback)
        
        self.messageCallbacks[subject] = sub
    }
    
    // TODO: handle non-subscription topics
    // MARK: - Send Message
    public func subscribe(_ subject: String, headers: HttpMethod.Headers? = nil, handler: @escaping ResponseCallback) -> Promise<Void> {

        let msg = WebSocketMessage(topic: MessageTopic.subscribe(subject).stringValue, headers: headers ?? [:])
        let message = URLSessionWebSocketTask.Message.string(msg.jsonString())

        self.addSubscription(subject, message: message, callback: handler)
        
        return Promise() { (resolve, reject) in
        
            self.task?.send(message) { error in
                guard let error = error else {
                    resolve(())
                    return
                }
                reject(error)
            }
        }
    }
    
    private func reperformSubscriptions(){
        for (subject, args) in self.messageCallbacks {
            self.task?.send(args.message) { error in
                guard let error = error else {
                    print("[WebSocketClient#reperformSubsciptions] resubscibed \"\(subject)\"")
                    return
                }
                print("[WebSocketClient#reperformSubsciptions] error subscribing \"\(subject)\": \(error)")
            }
        }
    }
    
    private func triggerCallbacks(subject: String, resp: Response?, error: Error?){
        
        guard let sub = self.messageCallbacks[subject] else { return }
        
        for cb in sub.callbacks {
            do {
                try cb(resp, error)
            } catch {
                debugPrint("[WebSocketClient#triggerCallbacks] subject=\(subject), error=\(error)")
            }
        }
    }
    
    private func receive(){
        self.task?.receive() { result in
            
            defer {
                
                if let response = result.successResponse, let subject = response.subject {
                    self.triggerCallbacks(subject: subject, resp: response, error: nil)
                }else{
                    print("[WebSocketClient#receive] Unhandled: \(result)")
                }
                
            }
            
            if case let Result.failure(error) = result {
                print("[receive] error response aborting...\(error)")
                self.connectionState = self.connectionState.lost()
                self.scheduleReconnect() // MARK: - Schedule Reconnect
                return
            }
            
            switch(self.connectionState){
            case .connected:
                print("[receive] scheduling next receive cycle...")
                OperationQueue.main.addOperation(self.receive)
            default:
                break
            }
            
        }
    }
    
    public func connect(connectionHandler: ((ConnectionState) -> Void)? = nil) {
        switch connectionState {
        case .stopped:
            connectionState = .reconnecting(0)
        case .reconnecting(let count) where count > 0:
            return
        default:
            break
        }
        
        startTask(connectionHandler: connectionHandler)
    }
    
    private func startTask(timeout: Double = 10, connectionHandler: ((ConnectionState) -> Void)? = nil){
        
        if let task = self.task {
            task.cancel(with: .goingAway, reason: "Initailizing new connection".data(using: .utf8))
        }
        
        var req = URLRequest(url: url)
        req.timeoutInterval = timeout
        self.task = self.session.webSocketTask(with: url)
        
        if let connectionHandler = connectionHandler {
            self.connectionHandler = connectionHandler
        }
        
        self.task!.resume()
    }

    public func disconnect() {
        connectionState = .stopped
        self.task?.cancel(with: .normalClosure, reason: nil)
    }
    
    var taskScheduled = false
    
    private func scheduleReconnect(){
        print("[connectionState] \(connectionState)")
        
        switch connectionState {
        case .reconnecting(let retryCount):
            let nextCount = retryCount + 1
            print("[WebSocketClient] reconnecting: \(nextCount)")
            connectionState = .reconnecting(nextCount)
            
            guard !taskScheduled else {
                return
            }
            
            taskScheduled = true
            DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime.now().advanced(by: .seconds(retryCount * 5))) {
                
                guard case .reconnecting(_) = self.connectionState else {
                    print("[WebSocketClient] aborting asyncAfter: \(self.connectionState)")
                    return
                }

                self.task?.cancel(with: .noStatusReceived, reason: "attempting reconnect".data(using: .utf8))
                self.startTask(timeout: Double(nextCount * 5))
            }
        default:
            return
        }
    }
    
}

extension WebSocketClient: URLSessionWebSocketDelegate {
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?){
        print("[WebSocketClient] Errored! \(String(describing: error))")
        connectionState = connectionState.lost()

        self.taskScheduled = false
        scheduleReconnect() // MARK: - Schedule Reconnect
    }
    
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("[WebSocketClient] Connected! - \(String(describing: `protocol`))")
        connectionState = connectionState.established()
        
        defer {
            self.reperformSubscriptions()
        }
        
        OperationQueue.main.addOperation(self.receive)
    }

    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        
        if let reason = reason {
            print("[WebSocketClient] Disconnected! \(closeCode) - \(String(data: reason, encoding: .utf8)!)")

        }else{
            print("[WebSocketClient] Disconnected! \(closeCode)")

        }

        self.taskScheduled = false
        connectionState = connectionState.lost()
        scheduleReconnect() // MARK: - Schedule Reconnect
    }
    
    public struct Response {
        public let topic: String
        public var subject: String?
        public let payload: Json
    }
    
}


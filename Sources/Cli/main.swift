//
//  main.swift
//  
//
//  Created by Anthony Chinwo on 05/12/2019.
//

import Foundation
import Commander
import JSONSchema
import SwiftSyntax
import JoliCore
@testable import Promises

let main = command(
    Argument<String>("schemaUrl", description: "Your name")
) { (schemaUrl: String) in
    print("Reading file \(schemaUrl)")
    
    let comp = URLComponents(string: "/api/db/schemas")!
    let baseUrl = URL(string: "https://localhost:8080")!
    
    let delegate = HttpsHook(trustedHosts: ["localhost"])
    let urlSess = URLSession.shared.updated(configuration: URLSession.shared.configuration,
                                            delegate: delegate)
    
    HttpMethod.get.fetchJson(urlPath: comp, payload: [:], baseUrl: baseUrl, urlSession: urlSess)
        .then() { json in
            let schema = Schema(json)
            
            
            
            print("Schema: \(schema)")
        }
        .catch(){ error in
            print("Error: \(error)")
        }
    
    
    waitForPromises(timeout: 2)
}

main.run()

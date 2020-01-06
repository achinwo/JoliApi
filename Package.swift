// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JoliApi",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "JoliApi",
            targets: ["JoliApi"]),
        .executable(name: "joli", targets: ["Cli"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/google/promises.git", from: "1.2.8"),
        .package(url: "https://github.com/kylef/JSONSchema.swift.git", from: "0.5.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "1.7.0")),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "0.50100.0"),
        .package(url: "https://github.com/tomlokhorst/swift-cancellationtoken.git", from: "3.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(
//        name: "Core",
//        dependencies: [],
//        path: "Frameworks/SpotifyiOS.framework",
//        linkerSettings: [
//            .linkedFramework("SpotifyiOS"),
//        ]),
        .target(name: "JoliCore",
                dependencies: ["Promises", "JSONSchema", "SwiftyBeaver", "Commander", "CancellationToken"],
                path: "Sources/Lib"
        ),
        .target(
            name: "Cli",
            dependencies: ["JoliCore", "SwiftSyntax"]
        ),
        .target(
            name: "JoliApi",
            dependencies: ["JoliCore"]
        ),
        .testTarget(
            name: "JoliApiTests",
            dependencies: ["JoliApi"]),
    ]
)

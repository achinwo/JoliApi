// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JoliApi",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7)
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
        .package(name: "Promises", url: "https://github.com/google/promises.git", from: "1.2.10"),
        .package(name: "JSONSchema", url: "https://github.com/kylef/JSONSchema.swift.git", from: "0.5.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "1.9.1")),
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", from: "0.50100.0"),
        .package(name: "CancellationToken", url: "https://github.com/tomlokhorst/swift-cancellationtoken.git", from: "3.2.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMajor(from: "4.0.4")),
        .package(name: "Version", url: "https://github.com/mxcl/Version.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/jathu/UIImageColors.git", .upToNextMajor(from: "2.2.0")),
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
                dependencies: ["Promises", "JSONSchema", "SwiftyBeaver", "Commander", "CancellationToken", "Starscream", "Version", "UIImageColors"],
                path: "Sources/Lib"
        ),
        .executableTarget(
            name: "Cli",
            dependencies: ["JoliApi", "SwiftSyntax"]
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

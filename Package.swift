// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "JoliApi",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "JoliApi",
            targets: ["JoliApi"]),
        .executable(name: "joli", targets: ["Cli"]),
        .library(
            name: "JoliMaqro",
            targets: ["Macros"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/kylef/JSONSchema.swift.git", from: "0.5.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMajor(from: "4.0.4")),
        .package(url: "https://github.com/mxcl/Version.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/jathu/UIImageColors.git", .upToNextMajor(from: "2.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .macro(
            name: "Metaprogramming",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "Macros", dependencies: ["Metaprogramming"]),
        .target(name: "JoliCore",
                dependencies: ["Commander", "Starscream", "Version", "UIImageColors", "Macros"],
                path: "Sources/Lib"
        ),
        .executableTarget(
            name: "Cli",
            dependencies: [
                "JoliApi",
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "JSONSchema", package: "JSONSchema.swift"),
            ]
        ),
        .target(
            name: "JoliApi",
            dependencies: ["JoliCore"]
        ),
        .testTarget(
            name: "JoliApiTests",
            dependencies: ["JoliApi"]
        ),
        // A test target used to develop the macro implementation.
        .testTarget(
            name: "MaqroTests",
            dependencies: [
                "Macros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)

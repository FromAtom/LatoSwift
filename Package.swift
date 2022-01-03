// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "LatoSwift",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "LatoSwift",
            targets: ["LatoSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LatoSwift",
            dependencies: [],
            resources: [.process("Fonts")]
        ),
        .testTarget(
            name: "LatoTests",
            dependencies: ["LatoSwift"]
        ),
    ]
)

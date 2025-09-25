// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Utils",
    products: [
        .library(
            name: "Utils",
            targets: ["Utils"]),
    ],
    dependencies: [
        .package(path: "../Networking")
    ],
    targets: [
        .target(
            name: "Utils",
            dependencies: [
                "Networking"
            ]),
        .testTarget(
            name: "UtilsTests",
            dependencies: ["Utils"]
        ),
    ]
)

// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "UIModule",
    products: [
        .library(
            name: "UIModule",
            targets: ["UIModule"]),
    ],
    targets: [
        .target(
            name: "UIModule"),
        .testTarget(
            name: "UIModuleTests",
            dependencies: ["UIModule"]
        ),
    ]
)

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Networking",
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.2"))
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        ),
    ]
)

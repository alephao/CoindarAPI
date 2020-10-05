// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CoindarAPI",
    products: [
        .library(
            name: "CoindarAPI",
            targets: ["CoindarAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0"))
    ],
    targets: [
        .target(
            name: "CoindarAPI",
            dependencies: ["Moya"]),
        .testTarget(
            name: "CoindarAPITests",
            dependencies: ["CoindarAPI", "Moya"]),
    ]
)

// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "CoindarAPI",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
    ],
    products: [
        .library(
            name: "CoindarAPI",
            targets: ["CoindarAPI"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Moya/Moya.git", from: .init(15, 0, 0))
    ],
    targets: [
        .target(
            name: "CoindarAPI",
            dependencies: ["Moya"]),
        .testTarget(
            name: "CoindarAPITests",
            dependencies: ["CoindarAPI", "Moya"],
            resources: [.process("Resources")]),
    ]
)

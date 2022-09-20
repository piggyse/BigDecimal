// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigDecimal",
    products: [
        .library(
            name: "BigDecimal",
            targets: ["BigDecimal"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mkrd/Swift-BigInt.git", branch: "master")
    ],
    targets: [
        .target(
            name: "BigDecimal",
            dependencies: [.product(name: "BigNumber", package: "Swift-BigInt")]),
        .testTarget(
            name: "BigDecimalTests",
            dependencies: ["BigDecimal"]),
    ]
)

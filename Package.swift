// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigDecimal",
    products: [
        .library(
            name: "BigDecimal",
            targets: ["BigDecimal"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BigDecimal",
            dependencies: []),
        .testTarget(
            name: "BigDecimalTests",
            dependencies: ["BigDecimal"])
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Randomizer",
    products: [
        .library(
            name: "Randomizer",
            type: .dynamic,
            targets: ["Randomizer"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "Randomizer",
            dependencies: []),
        .testTarget(
            name: "RandomizerTests",
            dependencies: ["Randomizer"]),
    ]
)

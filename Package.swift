// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DSAlg",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DSAlg",
            targets: ["DSAlg", "Heap", "DisjointSet", "Stack", "Queue"]),
        .library(
            name: "Heap",
            targets: ["Heap"]),
        .library(
            name: "DisjointSet",
            targets: ["DisjointSet"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DSAlg",
            dependencies: []),
        .testTarget(
            name: "DSAlgTests",
            dependencies: ["DSAlg"]),
        .target(
            name: "Heap",
            dependencies: []),
        .testTarget(
            name: "HeapTests",
            dependencies: ["Heap"]),
        .target(
            name: "DisjointSet",
            dependencies: []),
        .testTarget(
            name: "DisjointSetTests",
            dependencies: ["DisjointSet"]),
        .target(
            name: "Stack",
            dependencies: []),
        .testTarget(
            name: "StackTests",
            dependencies: ["Stack"]),
        .target(
            name: "Queue",
            dependencies: []),
        .testTarget(
            name: "QueueTests",
            dependencies: ["Queue"]),


        // Utility!
        .target(
            name: "DataGenerator",
            dependencies: []),
        .testTarget(
            name: "DataGeneratorTests",
            dependencies: ["DataGenerator"]),

    ]
)

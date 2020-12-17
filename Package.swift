// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ReactiveObjC",
    products: [
        .library(
            name: "ReactiveObjC",
            targets: ["ReactiveObjC"]),
    ],
    targets: [
        .binaryTarget(
            name: "ReactiveObjC",
            url: "",
            checksum: ""),
    ]
)
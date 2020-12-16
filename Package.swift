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
            url: "https://github.com/3a4oT/ReactiveObjC/releases/download/3.2.0/ReactiveObjC.xcframework.zip",
            checksum: ""),
    ]
)

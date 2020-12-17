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
            checksum: "4ce418944bd28e6aad008d221f7c25c765e856fe7c4db20c1632f14f0181870f"),
    ]
)
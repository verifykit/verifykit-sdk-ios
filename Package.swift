// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VerifyKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "VerifyKit", 
            targets: ["VerifyKit"])
    ],
    targets: [
        .binaryTarget(
            name: "VerifyKit", 
            path: "VerifyKit.xcframework")
    ])
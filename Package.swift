// swift-tools-version:5.0
import PackageDescription
let package = Package(
    name: "Watchlitude",
    products: [
        .library(name: "Watchlitude", targets: ["Watchlitude"])
    ],
    targets: [
        .target(name: "Watchlitude", path: "Watchlitude")
    ]
)

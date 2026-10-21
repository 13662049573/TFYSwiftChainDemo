// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "TFYEnhancedRuntimeChainKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "TFYEnhancedRuntimeChainKit",
            targets: ["TFYEnhancedRuntimeChainKit"]
        ),
    ],
    targets: [
        .target(
            name: "TFYEnhancedRuntimeChainKit",
            path: "TFYSwiftChainDemo/TFYEnhancedRuntimeChainKit"
        ),
    ],
    swiftLanguageVersions: [.v5]
)

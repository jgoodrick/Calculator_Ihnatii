// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CalculatorComponents",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "AppFeature",
            targets: [
                "AppFeature",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "0.6.0"
        ),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
                "CalculatorBrain",
                "CalculatorViews",
            ]
        ),
        .target(
            name: "CalculatorBrain"
        ),
        .target(
            name: "CalculatorViews"
        ),
        .testTarget(
            name: "CalculatorBrainTests",
            dependencies: ["CalculatorBrain"]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
                "AppFeature"
            ]
        ),
    ]
)

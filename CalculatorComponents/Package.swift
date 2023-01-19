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
                "CalculatorСomponent",
                "CalculatorViews",
            ]
        ),
        .target(
            name: "CalculatorСomponent"
        ),
        .target(
            name: "CalculatorViews"
        ),
        .testTarget(
            name: "CalculatorСomponentTests",
            dependencies: ["CalculatorСomponent"]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: ["AppFeature"]
        ),
    ]
)

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SQLite.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SQLiteSwift",
            targets: ["SQLiteSwift"]
        )
    ],
    targets: [
        .target(
            name: "SQLiteSwift",
            exclude: [
                "SQLite/Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteTests",
            dependencies: [
                "SQLiteSwift"
            ],
            path: "Tests/SQLiteTests",
            exclude: [
                "SQLite/Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif

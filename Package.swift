// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Traveller",
    products: [
        .library(name: "Traveller", targets: ["Traveller"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/vapor/fluent.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc.2"),
        .package(url: "https://github.com/kareman/SwiftShell.git", from: "4.0.2"),
        .package(url: "https://github.com/LiveUI/ErrorsCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/DbCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/ApiCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/MailCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/SettingsCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/VaporTestTools.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/FluentTestTools.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "TravellerApp",
            dependencies: [
                "Vapor",
                "Traveller"
            ]
        ),
        .target(name: "TravellerRun", dependencies: [
            "TravellerApp"
            ]
        ),
        .target(name: "Traveller", dependencies: [
            "Vapor",
            "Fluent",
            "FluentPostgreSQL",
            "ApiCore",
            "ErrorsCore",
            "DbCore",
            "SwiftShell",
            "MailCore",
            "SettingsCore"
            ]
        ),
        .testTarget(name: "TravellerTests", dependencies: [
            "Traveller",
            "VaporTestTools",
            "FluentTestTools",
            "ApiCoreTestTools"
            ]
        )
    ]
)

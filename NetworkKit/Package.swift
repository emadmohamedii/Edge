// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]
        ),
        .library(
            name: "PersistenceKit",
            targets: ["PersistenceKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.50.0"),
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: ["Alamofire"]
        ),
        .target(
            name: "PersistenceKit",
            dependencies:
                [
                    "NetworkKit",
                    .product(name: "RealmSwift", package: "realm-swift")
                ]
        ),
    ]
)

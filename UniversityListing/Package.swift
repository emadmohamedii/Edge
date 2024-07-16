// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniversityListing",
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UniversityListing",
            targets: ["UniversityListing"]),
    ],
    dependencies: [
        .package(path: "../NetworkKit"),
        .package(path: "../UIComponents"),
        .package(path: "../Common")

    ],
    targets: [
        .target(
            name: "UniversityListing",
            dependencies: [
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "PersistenceKit", package: "NetworkKit"),
                .product(name: "UIComponents", package: "UIComponents"),
                .product(name: "Common", package: "Common")
            ]),
    ]
)

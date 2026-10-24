// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "VLStringKit",
                      platforms: [ .iOS(.v17), .macOS(.v13) ],
                      products:
                      [
                       .library(name: "VLStringKit",
                                targets: [ "VLStringKit" ])
                      ],
                      targets:
                      [
                       .target(name: "VLStringKit"),
                       .testTarget(name: "VLStringKitTests",
                                   dependencies: [ "VLStringKit" ],
                                   swiftSettings: [ .enableUpcomingFeature("ApproachableConcurrency") ])
                      ])

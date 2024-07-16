//
//  UniversityListEntity.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import Foundation
import UIComponents

final public class UniversityListEntity {

    // MARK: - Properties
    public let name: String
    public let stateProvince: String
    public let countryCode: String
    public let country: String
    public let webPages: [String]

    // MARK: - Initialization
    public init(name: String, stateProvince: String, countryCode: String, country: String, webPages: [String]) {
        self.name = name
        self.stateProvince = stateProvince
        self.countryCode = countryCode
        self.country = country
        self.webPages = webPages
    }
}

// MARK: - Conformances

// MARK: UniversityCellItemProtocol Conformance
extension UniversityListEntity: UniversityCellItemProtocol {
    public var universityName: String {
        name
    }

    public var universityState: String {
        stateProvince
    }
}

// MARK: UniversityDetailsBuilderInput Conformance
extension UniversityListEntity: UniversityDetailsBuilderInput {
    public var id: String {
        name + stateProvince
    }
}

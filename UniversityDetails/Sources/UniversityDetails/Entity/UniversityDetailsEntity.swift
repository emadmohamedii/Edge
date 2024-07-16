//
//  UniversityDetailsEntity.swift
//
//
//  Created by Emad Habib on 15/07/2024.
//

import Foundation

final public class UniversityDetailsEntity {
    let name : String
    let stateProvince : String
    let countryCode: String
    let country: String
    let webPages: [String]
    
    /// Initializes a new instance of `UniversityDetailsEntity`.
    ///
    /// - Parameters:
    ///   - name: The name of the university.
    ///   - stateProvince: The state or province where the university is located.
    ///   - countryCode: The country code of the university.
    ///   - country: The country where the university is located.
    ///   - webPages: Array of web pages associated with the university.
    public init(name: String, stateProvince: String, countryCode: String, country: String, webPages: [String]) {
        self.name = name
        self.stateProvince = stateProvince
        self.countryCode = countryCode
        self.country = country
        self.webPages = webPages
    }
}

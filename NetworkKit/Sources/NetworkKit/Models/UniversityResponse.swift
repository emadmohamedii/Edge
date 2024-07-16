//
//  University.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import Foundation

public struct UniversityResponse : Codable {
    
    public let name : String?
    public let stateProvince : String?
    
    public let alphaTwoCode : String?
    public let country : String?
    public let domains : [String]?
    public let webPages : [String]?
    
    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case country
        case domains
        case name
        case stateProvince = "state-province"
        case webPages = "web_pages"
    }
    
    public init(alphaTwoCode: String? = nil,
                country: String? = nil,
                domains: [String]? = nil,
                name: String? = nil,
                stateProvince: String? = nil,
                webPages: [String]? = nil) {
        self.alphaTwoCode = alphaTwoCode
        self.country = country
        self.domains = domains
        self.name = name
        self.stateProvince = stateProvince
        self.webPages = webPages
    }
}

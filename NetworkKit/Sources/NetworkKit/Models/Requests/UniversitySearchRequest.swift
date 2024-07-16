//
//  UniversitySearchRequest.swift
//  NetworkKit
//
//  Created by Emad Habib on 15/7/2025.
//

import Foundation

public struct UniversitySearchRequest: Encodable {
    var country: String
    
    public init(country: String) {
        self.country = country
    }
    
    // CodingKeys for customization
    enum CodingKeys: String, CodingKey {
        case country
    }
}

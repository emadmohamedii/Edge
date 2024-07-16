//
//  University.swift
//
//
//  Created by Emad Habib on 15/07/2024.
//

import Foundation
import RealmSwift
import NetworkKit

public class University: Object {
    @objc dynamic var name: String? = nil
    @objc dynamic var stateProvince: String? = nil
    @objc dynamic var alphaTwoCode: String? = nil
    @objc dynamic var country: String? = nil
    let domains = List<String>()
    let webPages = List<String>()
    
    public convenience init(from response: UniversityResponse) {
        self.init()
        self.name = response.name
        self.stateProvince = response.stateProvince
        self.alphaTwoCode = response.alphaTwoCode
        self.country = response.country
        self.domains.append(objectsIn: response.domains ?? [])
        self.webPages.append(objectsIn: response.webPages ?? [])
    }

    func toResponse() -> UniversityResponse {
        UniversityResponse(
            alphaTwoCode: self.alphaTwoCode,
            country: self.country, domains: Array(self.domains), name: self.name,
            stateProvince: self.stateProvince,
            webPages: Array(self.webPages)
        )
    }
}

//
//  UniveristyListingAPIRouter.swift
//  NetworkKit
//
//  Created by Emad Habib on 15/7/2025.
//

import Foundation


enum UniversityListingAPIRouter: APIRouterProtocol {
    case search
    
    var path: String {
        return "search"
    }
}

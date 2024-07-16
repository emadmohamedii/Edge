//
//  UniversityListingLoader.swift
//  NetworkKit
//
//  Created by Emad Habib on 15/7/2024.
//

import Foundation


// Protocol for the UniversityListingLoaderProtocol
public protocol UniversityListingLoaderProtocol {
    func loadUniversity(with parameters: UniversitySearchRequest,
                        completionHandler: @escaping (APIResult<[UniversityResponse]>) -> Void)
}

// UniversityLoader class implementing the UniversityListingLoader and LoaderProtocol
public final class UniversityListingLoader: UniversityListingLoaderProtocol, APILoaderProtocol {
    public typealias Entity = [UniversityResponse]
    
    public init() { }
    
    // MARK: Call API Request
    public func loadUniversity(with parameters: UniversitySearchRequest,
                               completionHandler: @escaping (APIResult<Entity>) -> Void) {
        let configuration = APIRequestConfiguration(router: UniversityListingAPIRouter.search,
                                                    method: .get(parameters: parameters))
        loadItems(requestConfiguration: configuration, completionHandler: completionHandler)
    }
}

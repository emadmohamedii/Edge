//
//  NetworkLayerConfig.swift
//  TMDB
//
//  Created by Emad Habib on 15/7/2025.
//

import Foundation
import Alamofire

public protocol NetworkLayerConfigProtocol {
    init(baseUrl: String, token: String?)
    func getToken() -> String
    func updateToken(_ token: String)
    func getBaseUrl() -> String
}

final public class NetworkLayerConfig: NetworkLayerConfigProtocol {
    // MARK: Properites
    private let baseUrl: String
    private var token: String?

    // MARK: initializer to enforce singleton pattern
    public init(baseUrl: String, token: String?) {
        self.baseUrl = baseUrl
        self.token = token
    }
    
    public func getBaseUrl() -> String {
        baseUrl
    }
    public func getToken() -> String {
        token ?? ""
    }
    
    public func updateToken(_ token: String) {
        self.token = token
    }
}

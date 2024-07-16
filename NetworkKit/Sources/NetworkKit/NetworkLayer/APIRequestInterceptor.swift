//
//
//  Created by Emad Habib on 15/7/2025.
//

import Foundation
import Alamofire

final class APIRequestInterceptor: RequestInterceptor {

    private let token: String

    // MARK: Init
    init(token: String) {
        self.token = token
    }
    /// Adapts the given URLRequest by adding an Authorization header if a token is present.
    /// - Parameters:
    ///   - urlRequest: The original URLRequest that needs to be adapted.
    ///   - session: The Alamofire session (not used in this function).
    ///   - completion: The completion handler to call with the modified request.
    func adapt(_ urlRequest: URLRequest, for _: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        // If the token is not empty, add the Authorization header to the request
        if !token.isEmpty {
            urlRequest.headers.add(.authorization(bearerToken: token))
        }
        
        // Call the completion handler with the modified request
        // Note: There is no failure case because this adaptation process is straightforward and cannot fail
        // under normal circumstances. Adding a header to a URLRequest is a safe operation that does not
        // involve any network or external resource that could fail.
        completion(.success(urlRequest))
    }
}

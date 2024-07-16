//
//
//  Created by Emad Habib on 14/07/2024.
//

import Foundation
import UIKit

public protocol AlertPopupProtocol {
    func showAlert(title: String,
                   message: String,
                   preferredStyle: UIAlertController.Style,
                   alertActionTitle: String,
                   completionHandler: (() -> Void)?)
}

extension UIViewController: AlertPopupProtocol {
    public func showAlert(title: String = "Error",
                          message: String,
                          preferredStyle: UIAlertController.Style = .alert,
                          alertActionTitle: String = "OK",
                          completionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        
        let okAction = UIAlertAction(title: alertActionTitle, style: .default) { _ in
            completionHandler?()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

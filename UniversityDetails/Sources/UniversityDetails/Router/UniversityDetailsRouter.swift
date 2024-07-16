//
//
//  Created by Emad Habib on 15/07/2024.
//

import UIKit
import Common

final public class UniversityDetailsRouter {
    weak var viewController: UniversityDetailsViewController?
    weak var delegate: DetailsModuleDelegate?
    
    // MARK: - Init
    init(viewController: UniversityDetailsViewController, delegate: DetailsModuleDelegate?) {
        self.viewController = viewController
        self.delegate = delegate
    }
}

extension UniversityDetailsRouter : UniversityDetailsRouterProtocol {
    // Method to dismiss current view controller and trigger a reload action
    func dismissAndReload() {
        // Notify the delegate to refresh listing data
        self.delegate?.refreshListingDataAction()
        
        // Dismiss current view controller
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}

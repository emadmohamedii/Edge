//
//  UniversityDetailsConfigurator.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import Foundation
import NetworkKit
import Common

public final class UniversityDetailsConfigurator {
    
    // MARK: Configuration
    
    /// Configures and returns an instance of `UniversityDetailsViewController`.
    ///
    /// - Parameters:
    ///   - university: The `UniversityDetailsEntity` object containing university details.
    ///   - delegate: The delegate conforming to `DetailsModuleDelegate` to handle module-level actions.
    /// - Returns: An instance of `UniversityDetailsViewController` configured with necessary dependencies.
    public class func viewController(university: UniversityDetailsEntity?,
                                     delegate: DetailsModuleDelegate?) -> UniversityDetailsViewController {
        let view = UniversityDetailsViewController(nibName: "UniversityDetailsViewController", bundle: .module)
        let router = UniversityDetailsRouter(viewController: view,delegate: delegate)
        let presenter = UniversityDetailsPresenter(view: view, university: university, router: router)
        view.presenter = presenter
        return view
    }
}

// MARK: - Protocols

// Protocol for communication from Presenter to Controller
protocol UniversityDetailsPresentable: AnyObject {
    func reloadListing()
    func fetchUniversityData()
}

// Protocol for communication from Controller to Presenter
protocol UniversityDetailsControllerProtocol: AnyObject {
    func showUniversityDetails(university : UniversityDetailsEntity?)
}

// Protocol for communication from Presenter to Router
protocol UniversityDetailsRouterProtocol: AnyObject {
    func dismissAndReload()
}

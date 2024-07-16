//
//  MainRouter.swift
//  EdgeTask
//
//  Created by Emad Habib on 15/07/2024.
//

import UIKit
import UniversityListing
import UniversityDetails
import Common

final class MainRouter {
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        // Configure the University List module as the initial root view controller
        let rootViewController = UniversityListConfigurator.viewController(routerDelegate: self)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        // Set the navigation controller as the root view controller of the window
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension MainRouter : UniversityListRouterDelegate {
    // Navigate to University Details module
    // Centralized navigation logic to avoid code duplication and maintain separation between packages.
    // Navigation between modules is handled in the main router because the host app has visibility into all packages, while packages themselves do not access each other.
    func navigateToDetails(university: UniversityListing.UniversityListEntity?, refreshDelegate: (any DetailsModuleDelegate)?) {
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            return
        }
        // Create University Details view controller with necessary data and delegate
        let viewController = UniversityDetailsConfigurator.viewController(
            university: .init(
                name: university?.name ?? "",
                stateProvince: university?.stateProvince ?? "",
                countryCode: university?.countryCode ?? "",
                country: university?.country ?? "",
                webPages: university?.webPages ?? []
            ),
            delegate: refreshDelegate
        )
        // Push University Details view controller onto navigation stack
        navigationController.pushViewController(viewController, animated: true)
    }
}

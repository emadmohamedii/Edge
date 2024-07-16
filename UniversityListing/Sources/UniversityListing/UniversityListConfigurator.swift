//
//  UniversityListConfigurator.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import NetworkKit
import Common

// Protocol to pass data to University Details module
public protocol UniversityDetailsBuilderInput {
    var id: String { get }
}

// Example input struct conforming to UniversityDetailsBuilderInput
struct UniversityDetailsInput: UniversityDetailsBuilderInput {
    let id: String
}

// Protocol for routing from University List module to University Details module
public protocol UniversityListRouterDelegate: AnyObject {
    func navigateToDetails(university : UniversityListEntity?, refreshDelegate : DetailsModuleDelegate?)
}

// Configurator class for University List module setup
final public class UniversityListConfigurator {
    
    // MARK: Configuration
    
    // Function to configure and return the view controller for University List module
    public class func viewController(routerDelegate : UniversityListRouterDelegate?) -> UniversityListViewController {
        let view = UniversityListViewController(nibName: "UniversityListViewController", bundle: .module)
        let loader = UniversityListingLoader()
        let interactor = UniversityListInteractor(loader: loader)
        let router = UniversityListRouter(viewController: view, routerDelegate: routerDelegate)
        let presenter = UniversityListPresenter(view: view,
                                                interactor: interactor,
                                                router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}

// MARK: - Protocols

// Protocol for interactions from Presenter to Controller
protocol UniversityListPresentable: AnyObject {
    var universitiesItemsCount: Int { get }
    func getItem(at index: Int) -> UniversityListEntity?
    func navigateToUniversityDetails(with index: Int)
}

// Protocol for Presenter actions in University List module
protocol UniversityListPresenterProtocol: UniversityListPresentable {
    func fetchUniversityData()
}

// Protocol for interactions from Presenter to Controller
protocol UniversityListControllerProtocol: AnyObject {
    func reloadCollectionView()
    func presentError(with message: String)
    func animateLoadingIndicator()
    func stopLoadingIndicator()
    func showCollectionPlaceholderLabel()
    func hideCollectionPlaceholderLabel()
    func updateCollectionPlaceholderLabel(text: String)
}

// Protocol for interactions from Presenter to Interactor
protocol UniversityListPresenterInteractorProtocol: AnyObject {
    func fetchUniversityList()
}

// Protocol for interactions from Interactor to Presenter
protocol UniversityListInteractorOutput: AnyObject {
    func didFetchUniversities(_ universities: [UniversityListEntity])
    func didFailToFetchUniversities(with error: Error)
    func setLoadingIndicatorVisible(_ isVisible: Bool)
}

// Protocol for interactions from Presenter to Router
protocol UniversityListRouterProtocol: AnyObject {
    func navigateToUniversityDetails(for university: UniversityListEntity? , refreshDelegate : DetailsModuleDelegate?)
}

//
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import Common

final class UniversityListPresenter: NSObject {
    
    // MARK: - Properites
    private weak var view: UniversityListControllerProtocol?
    private var interactor: UniversityListPresenterInteractorProtocol?
    private var router: UniversityListRouterProtocol?
    private var universities = [UniversityListEntity]()
    private let loadingDataText = "Loading data..."
    private let errorPlaceHolderText = "No Data to Present"
    private let networkHelper = NetworkHelper.shared
    
    // MARK: - Init
    init(view: UniversityListControllerProtocol?,
         interactor: UniversityListPresenterInteractorProtocol?,
         router: UniversityListRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Conform to UniversityListPresenterProtocol
extension UniversityListPresenter: UniversityListPresenterProtocol {
    
    func getItem(at index: Int) -> UniversityListEntity? {
        self.universities[safe: index]
    }
    
    var universitiesItemsCount: Int {
        self.universities.count
    }
    
    func fetchUniversityData() {
        // Remove old loaded data and empty tableView
        clearUniversitiesAndReloadData()
        // Show placeholder label during loading data
        handleShowingEmptyListPlaceHolder(with: loadingDataText)
        // Load data
        interactor?.fetchUniversityList()
    }
    
    private func clearUniversitiesAndReloadData(){
        self.universities.removeAll()
        self.view?.reloadCollectionView()
    }
    
    func navigateToUniversityDetails(with index: Int) {
        guard let selectedUniversity = self.universities[safe: index] else { return }
        self.router?.navigateToUniversityDetails(for: selectedUniversity, refreshDelegate: self)
    }
    
    func setLoadingIndicatorVisible(_ isVisible: Bool) {
        guard isVisible else {
            self.view?.stopLoadingIndicator()
            return
        }
        handleShowingEmptyListPlaceHolder(with: loadingDataText)
        self.view?.animateLoadingIndicator()
    }
    
    private func handleShowingEmptyListPlaceHolder(with text: String) {
        guard self.universities.isEmpty else { return }
        self.view?.updateCollectionPlaceholderLabel(text: text)
        self.view?.showCollectionPlaceholderLabel()
    }
}

// MARK: - Conform to UniversityListInteractorOutput

extension UniversityListPresenter: UniversityListInteractorOutput {
    
    func didFetchUniversities(_ universities: [UniversityListEntity]) {
        self.universities = universities
        self.view?.hideCollectionPlaceholderLabel()
        self.view?.reloadCollectionView()
    }
    
    func didFailToFetchUniversities(with error: any Error) {
        self.view?.presentError(with: error.localizedDescription)
        self.handleShowingEmptyListPlaceHolder(with: errorPlaceHolderText)
    }
}

// MARK: - DetailsModuleDelegate
extension UniversityListPresenter: DetailsModuleDelegate {
    
    func refreshListingDataAction() {
        print("refresh Listing Data Action")
        guard self.networkHelper.isConnected else {
            return
        }
        self.fetchUniversityData()
    }
}

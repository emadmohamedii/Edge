//
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import NetworkKit
import PersistenceKit

final class UniversityListInteractor {
    
    // MARK: - Properties

    var presenter: UniversityListInteractorOutput?
    
    private let universityLoader: UniversityListingLoaderProtocol
    private var isFetching = false
    private let realmHelper = RealmHelper()
    private let uae = "United Arab Emirates"
    
    // MARK: - Init
    init(loader: UniversityListingLoaderProtocol) {
        self.universityLoader = loader
    }
}

// MARK: - UniversityListPresenterInteractorProtocol

extension UniversityListInteractor: UniversityListPresenterInteractorProtocol {
    
    // MARK: - Fetch University List
    func fetchUniversityList() {
        guard shouldFetchUniversityList else { return }
        
        isFetching = true
        showLoadingIndicator(true)
        universityLoader.loadUniversity(with: .init(country: uae)) { [weak self] result in
            guard let self = self else { return }
            self.handleFetchedResult(result)
            self.isFetching = false
            self.stopLoadingIndicators()
        }
    }
    
    private func mapToEntity(_ model: UniversityResponse) -> UniversityListEntity {
        .init(name: model.name ?? "",
              stateProvince: model.stateProvince ?? "",
              countryCode: model.alphaTwoCode ?? "",
              country: model.country ?? "",
              webPages: model.webPages ?? [])
    }
}


// MARK: - Private Methods
extension UniversityListInteractor {
    private var shouldFetchUniversityList: Bool {
        !isFetching
    }
    
    private func showLoadingIndicator(_ isVisible: Bool) {
        presenter?.setLoadingIndicatorVisible(isVisible)
    }
    
    private func handleFetchedResult(_ result: Result<[UniversityResponse], Error>) {
        switch result {
        case .success(let universityResponse):
            handleSuccessfulFetch(universityResponse)
        case .failure(let error):
            handleFailedFetch(error)
        }
    }
    
    private func handleSuccessfulFetch(_ universityResponse: [UniversityResponse]) {
        let universityEntities = universityResponse.compactMap { mapToEntity($0) }
        presenter?.didFetchUniversities(universityEntities)
        // If API returned with data, clear old data in the database and save the new array
        cleanDBForNewUniversityData()
        saveUniversityDataInLocalDB(universityResponse)
    }
    
    private func handleFailedFetch(_ error: Error) {
        let universityEntities = realmHelper.getAllUniversities().compactMap { mapToEntity($0) }
        if universityEntities.isEmpty {
            presenter?.didFailToFetchUniversities(with: error)
        }
        else {
            debugPrint("Data Fetched from DB")
            presenter?.didFetchUniversities(universityEntities)
            stopLoadingIndicators()
        }
    }
    
    private func stopLoadingIndicators() {
        showLoadingIndicator(false)
    }
    
    private func saveUniversityDataInLocalDB(_ universityResponse: [UniversityResponse]){
        realmHelper.addUniversities(universityResponse)
    }
    
    private func cleanDBForNewUniversityData() {
        realmHelper.deleteAllUniversities()
    }
}

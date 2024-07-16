//
//  UniversityDetailsPresenter.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import NetworkKit

final class UniversityDetailsPresenter: NSObject {
    
    // MARK: - Properites
    
    private weak var view: UniversityDetailsControllerProtocol?
    private var university : UniversityDetailsEntity?
    private var router : UniversityDetailsRouterProtocol?
    
    // MARK: - Init
    
    init(view: UniversityDetailsControllerProtocol?,
         university : UniversityDetailsEntity?,
         router: UniversityDetailsRouterProtocol?) {
        self.view = view
        self.university = university
        self.router = router
    }
}

// MARK: - Conform to UniversityDetailsPresentable

extension UniversityDetailsPresenter: UniversityDetailsPresentable {
    
    // Method to fetch university data and display in the view
    func fetchUniversityData() {
        view?.showUniversityDetails(university: self.university)
    }
    
    // Method to reload listing, typically navigate back and refresh data
    func reloadListing() {
        // Navigate to home screen with action of reload listing
        router?.dismissAndReload()
    }
}

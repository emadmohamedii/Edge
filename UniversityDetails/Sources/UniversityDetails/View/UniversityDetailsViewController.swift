//
//  UniversityDetailsViewController.swift
//
//
//  Created by Emad Habib on 15/07/2024.
//

import UIKit
import UIComponents

public final class UniversityDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var universityNameLbl: UILabel!
    @IBOutlet private weak var universityStateLbl: UILabel!
    @IBOutlet private weak var universityCountryLbl: UILabel!
    @IBOutlet private weak var universityCountryCodeLbl: UILabel!
    @IBOutlet private weak var universityWebPageTV: UITextView!

    // MARK: Properties
    var presenter: UniversityDetailsPresentable?
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        presenter?.fetchUniversityData()
    }
    
    // MARK: - Actions
    @IBAction func didTapRefresh(){
        presenter?.reloadListing()
    }
}

// MARK: - Conform to UniversityDetailsControllerProtocol
extension UniversityDetailsViewController : UniversityDetailsControllerProtocol {
    
    // Method to display university details in the UI
    func showUniversityDetails(university: UniversityDetailsEntity?) {
        if let university = university {
            universityNameLbl.text = university.name
            universityStateLbl.text = university.stateProvince
            universityCountryLbl.text = university.country
            universityCountryCodeLbl.text = university.countryCode
            universityWebPageTV.text = university.webPages.joined(separator: ", ")
        }
        else {
            // Show an alert if university details are not available
            self.showAlert(message: "Unknown Error")
        }
    }
}

//
//  UniversityListViewController.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import UIKit
import UIComponents


public final class UniversityListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var emptyListPlaceHolderlabel: UILabel!
    
    // MARK: Properties
    var presenter: UniversityListPresenterProtocol?
        
    // MARK: Init
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        presenter?.fetchUniversityData()
        configTableView()
    }
    
    // MARK: Configurations
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UniversityCell.self)
    }
}


// MARK: - Conform to UniversityListControllerProtocol
extension UniversityListViewController: UniversityListControllerProtocol {
    
    func presentError(with message: String) {
        self.showAlert(message: message)
    }
    
    func reloadCollectionView() {
        self.tableView.reloadData()
    }
    
    // show/hide the loading indicator
    func animateLoadingIndicator() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }

    // Handle Placeholder
    func showCollectionPlaceholderLabel() {
        self.emptyListPlaceHolderlabel.isHidden = false
    }
    
    func hideCollectionPlaceholderLabel() {
        self.emptyListPlaceHolderlabel.isHidden = true
    }
    
    func updateCollectionPlaceholderLabel(text: String) {
        self.emptyListPlaceHolderlabel.text = text
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension UniversityListViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.universitiesItemsCount ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UniversityCell = tableView.dequeueCell(for: indexPath)
        let cellItem = self.presenter?.getItem(at: indexPath.row)
        cell.configCell(with: cellItem)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToUniversityDetails(with: indexPath.item)
    }
}

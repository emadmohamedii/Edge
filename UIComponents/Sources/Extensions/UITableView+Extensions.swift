//
//  UITableView.swift
//
//
//  Created by Emad Habib on 14/07/2024.
//

import Foundation
import UIKit

public extension UITableView {
    /// **Dequeues a reusable cell of the specified type**
    /// - Parameter indexPath: The index path specifying the location of the cell
    /// - Returns:  dequeued cell of the specified type.
    /// ```
    /// let cell: MyCell = myTableView.dequeueCell(for: indexPath)
    /// ```
    func dequeueCell<CellType: UITableViewCell>(for indexPath: IndexPath) -> CellType {
        guard let cell = self.dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("DequeueReusableCell failed while casting")
        }
        return cell
    }
    
    /// **Registers Cell**
    /// - Parameter cellType: The type of cell to register.
    /// ```
    /// myTableView.registerNib(MyCell.self)
    /// ```
    func registerNib<CellType: UITableViewCell>(_ cellType: CellType.Type) {
        register(CellType.loadNib, forCellReuseIdentifier: CellType.identifier)
    }

    /// **Registers a reusable header or footer view.**
    /// - Parameter viewType: The type of header or footer view to register.
    /// ```
    /// myTableView.registerNib(MyHeaderView.self)
    /// ```
    func registerNib<ViewType: UITableViewHeaderFooterView>(_ viewType: ViewType.Type) {
        register(ViewType.loadNib, forHeaderFooterViewReuseIdentifier: ViewType.identifier)
    }
}

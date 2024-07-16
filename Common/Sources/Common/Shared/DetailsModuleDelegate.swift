//
//  DetailsModuleDelegate.swift
//
//
//  Created by Emad Habib on 16/07/2024.
//

import Foundation

/// Protocol for delegates of the Details module to handle actions related to data updates.
public protocol DetailsModuleDelegate: AnyObject {
    /// Notifies the delegate to perform an action to refresh the listing data.
    func refreshListingDataAction()
}

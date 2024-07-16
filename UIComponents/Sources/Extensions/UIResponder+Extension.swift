//
//  UIResponder+Extension.swift
//  UIComponents
//
//  Created by Emad Habib on 15/7/2025.
//

import Foundation
import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension UIResponder: Identifiable {
    public static var identifier: String { String(describing: self) }
}

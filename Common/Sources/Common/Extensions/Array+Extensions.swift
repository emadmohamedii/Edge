//
//  Array+Extensions.swift
//  TMDB
//
//  Created by Emad Habib on 15/7/2024.
//

import Foundation

extension Array {
    /// Subscript that returns nil instead of crashing when accessing an out-of-bounds index.
    public subscript(safe index: Int) -> Element? {
        get {
            return indices ~= index ? self[index] : nil
        }
        set {
            if let newValue = newValue, indices ~= index {
                self[index] = newValue
            }
        }
    }
}

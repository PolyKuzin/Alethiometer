//
//  SafeIndex.swift
//  Gliese_581
//
//  Created by Павел Кузин on 24.12.2020.
//

import UIKit

// MARK: - Safe index in collection
public extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


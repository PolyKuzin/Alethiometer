//
//  Date.swift
//  Gliese_581
//
//  Created by Павел Кузин on 29.12.2020.
//

import UIKit

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var nextMonth: String {
//        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var afterNextMonth: String {
//        let nextMonth = Calendar.current.date(byAdding: .month, value: 2, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}

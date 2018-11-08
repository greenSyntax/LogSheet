//
//  Extensions.swift
//  LogSheet
//
//  Created by Abhishek on 08/11/18.
//

import Foundation

extension Date {
    
    static let formatter = DateFormatter()
    
    public func toString() -> String {
        Date.formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
        return Date.formatter.string(from: self)
    }

}

extension String {
    
    public func toDate() -> Date? {
        Date.formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
        return Date.formatter.date(from: self)
    }
}

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

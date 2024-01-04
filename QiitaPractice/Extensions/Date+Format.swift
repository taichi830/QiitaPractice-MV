//
//  Date+Format.swift
//  QiitaPractice
//
//  Created by fukuda taichiro on 2024/01/03.
//

import Foundation

extension DateFormatter {
    /// e.g. 2024年1月1日
    static var longStyle: DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = .init(identifier: .gregorian)
        formatter.locale = .init(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }
}

extension Date {
    var long: String {
        DateFormatter.longStyle.string(from: self)
    }
}

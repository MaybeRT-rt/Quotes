//
//  DateFormat.swift
//  Quotes
//
//  Created by Liz-Mary on 20.09.2023.
//

import Foundation

import Foundation

class DateFormat {
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}

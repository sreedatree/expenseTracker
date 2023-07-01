//
//  extensions.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/1/23.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("background")
    static let icon = Color("icon")
    static let text = Color("text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from:self) else {return Date()}
        
        return parsedDate
    }
}

//
//  transactionModel.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/1/23.
//

import Foundation

struct Transaction: Indentifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
}

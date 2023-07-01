//
//  TransactionRow.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/1/23.
//

import SwiftUI

struct TransactionRow: View {
    var transaction : Transaction
    
    var body: some View {
        HStack(spacing:20) {
            VStack(alignment: .leading, spacing: 6){
                // merchant of where transaction took place
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // category of the transaction
                Text(transaction.category)
                    .font(.caption)
                    .opacity(0.65)
                    .lineLimit(1)
                
                // date of the transaction
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.callout)
                    .foregroundColor(.secondary)
                    //.opacity(1)
                    //.lineLimit(1)
            }
            Spacer()
                .frame(width: 50.0)
                
            // amount spent in transaction
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
            
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRow(transaction: transactionPreviewData)
            TransactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}

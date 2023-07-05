//
//  transactionList.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/5/23.
//

import SwiftUI

struct transactionList: View {
    @EnvironmentObject var transactionListVM: transactionListViewModel
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) {month,
                    transactions in
                    Section {
                        ForEach(transactions) {transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }

                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct transactionList_Previews: PreviewProvider {
    static let transactionListVM: transactionListViewModel = {
        let transactionListVM = transactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            NavigationView {
                transactionList()
            }
            NavigationView {
                transactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}

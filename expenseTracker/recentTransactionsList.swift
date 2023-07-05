//
//  recentTransactionsList.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/2/23.
//

import SwiftUI

struct recentTransactionsList: View {
    @EnvironmentObject var transactionListVM: transactionListViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .font(.headline)
                
                Spacer()
                
                NavigationLink {
                    transactionList()
                } label: {
                    HStack(spacing: 5.5) {
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) {index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        
        
    }
}

struct recentTransactionsList_Previews: PreviewProvider {
    static let transactionListVM: transactionListViewModel = {
        let transactionListVM = transactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            recentTransactionsList()
            recentTransactionsList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }

}

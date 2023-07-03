//
//  recentTransactionsList.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/2/23.
//

import SwiftUI

struct recentTransactionsList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .font(.headline)
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 5.5) {
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
        }
        .padding()
    }
}

struct recentTransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        recentTransactionsList()
    }
}

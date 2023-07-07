//
//  ContentView.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/1/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: transactionListViewModel
    // var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView{
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Overview")
                            .font(.title2)
                            .bold()
                        
                        let data = transactionListVM.accumulateTransactions()
                        if !data.isEmpty {
                            let totalExpenses = data.last?.1 ?? 0
                            
                            CardView {
                                VStack(alignment: .leading) {
                                    ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                    LineChart()
                                }
                                .background(Color.systemBackground)
                            }
                            .data(data)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                            .frame(height: 300)
                        }
                            recentTransactionsList()
                        
                    } // end of vstack
                    .padding()
                    .frame(maxWidth: .infinity) // infinity is used for the frame to spread the background color
                } // end of scrollview
                .background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // notification Icon
                    ToolbarItem{ // toolbar item is used for item located on the upper toolbar. currently being used for the notification bell
                        Image(systemName: "bell.badge") // notification bell
                            .symbolRenderingMode(.palette) // for bell to use colors from set palette
                            .foregroundStyle(Color.icon, .primary)
                    } // end of toolbar item
                } // end od toolbar
            } // end of navigation view
            .navigationViewStyle(.stack)
        } // end of body
    } // end of view

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: transactionListViewModel = {
        let transactionListVM = transactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}

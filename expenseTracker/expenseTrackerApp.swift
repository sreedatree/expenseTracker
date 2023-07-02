//
//  expenseTrackerApp.swift
//  expenseTracker
//
//  Created by Purna Yalamanchili on 7/1/23.
//

import SwiftUI

@main
struct expenseTrackerApp: App {
    @StateObject var transactionListVM = transactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

//
//  ContentView.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Overview")
                            .font(.title2)
                            .bold()
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // infinity is used for the frame to spread the background color
                }
                .background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // notification Icon
                    ToolbarItem{
                        Image(systemName: "bell.badge") // notification bell
                            .symbolRenderingMode(.palette) // for bell to use colors from set palette
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

//
//  transactionListViewModel.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/2/23.
//

import Foundation
import Combine


final class transactionListViewModel : ObservableObject {
    
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{(data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                    
                case .finished:
                    print("finished fetching all recent transactions")
                    
                }
                
                } receiveValue: {[weak self] result in // weak self is used to create the weak reference to self. it prevents memory leaks as it can release self from memory when needed.
                    self?.transactions = result
                }
                .store(in: &cancellables)
                
            }
    }

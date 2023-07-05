//
//  transactionListViewModel.swift
//  expenseTracker
//
//  Created by Sree Yalamanchili on 7/2/23.
//

import Foundation
import Combine
import Collections


typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class transactionListViewModel : ObservableObject { //declaring a class as final, so that no other class can inherit from it
    
    @Published var transactions: [Transaction] = [] //@published is being used to allow us to create observable objects that automatically announce when changes occur and notify users of changes (such as withdrawals, deposits, transactions, etc.) var transactions is being assigned to the array of transactions
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    } // creating an intializer for getTransactions
    
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("invalid URL")
            return
        } // function getTransactions is taking the json file and importing that data. if it doesn't import, it will say "invalid URL"
        
        URLSession.shared.dataTaskPublisher(for: url) // this line of code returns a publisher that wraps a URL session data task for a given URL.
            .tryMap{(data, response) -> Data in // the trymap operator uses a closure to transform each element it receives from the publisher who receives elements (aka the upstream publisher)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response) // ouputs the whole hierarchy of 'response'
                    throw URLError(.badServerResponse) // throw function is used in order to handle errors
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder()) //.decode is used for decoding the JSON File to output the way it was programmed to
            .receive(on: DispatchQueue.main) // .receive is used to recieve results from the option after 'on: '. in this case, it is being used for receiving results from dispatchqueue.main.
            .sink {completion in // .sink is used for observing values received by the publisher and printing them to the console
                switch completion {
                case .failure(let error): // if it fails, print an error message to the console and along with it, print the error type.
                    print("Error fetching transactions:", error.localizedDescription)
                    
                case .finished: // if it successfully completed, print a message to the console.
                    print("finished fetching all recent transactions")
                    
                }
                
                } receiveValue: {[weak self] result in // weak self is used to create the weak reference to self. it prevents memory leaks as it can release self from memory when needed.
                    self?.transactions = result
                }
                .store(in: &cancellables)
                
            }
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) {$0.month}
        
        return groupedTransactions
    }
    }

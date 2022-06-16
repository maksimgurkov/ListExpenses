//
//  Model.swift
//  ListExpenses
//
//  Created by Максим Гурков on 15.06.2022.
//

import Foundation

class Expense {
    var id = UUID()
    var name: String
    var sum: Int?
    var count: Int?
    var listExpenses = [Expenses]()
    
    init (name: String) {
        self.name = name
    }
}

class Expenses {
    var name: String
    var sum: Int
    
    init (name: String, sum: Int) {
        self.name = name
        self.sum = sum
    }
    
}

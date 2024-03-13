//
//  ExpensesViewModel.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI
import CoreData

final class ExpensesViewModel: ObservableObject {

    @Published var status: [String] = ["New", "In work", "Done", "Check", "Waiting for payment"]
    @Published var currentStatus = "New"
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"

    @Published var exTitle: String = ""
    @Published var exDate: String = ""
    @Published var exCost: String = ""
    @Published var exDetails: String = ""
    @Published var exNotes: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var expenses: [ExpensesModel] = []
    @Published var selectedExpense: ExpensesModel?

    func addExpense() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExpensesModel", into: context) as! ExpensesModel

        loan.exTitle = exTitle
        loan.exDate = exDate
        loan.exCost = exCost
        loan.exDetails = exDetails
        loan.exNotes = exNotes

        CoreDataStack.shared.saveContext()
    }
    
    func fetchExpenses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpensesModel>(entityName: "ExpensesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.expenses = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.expenses = []
        }
    }
}


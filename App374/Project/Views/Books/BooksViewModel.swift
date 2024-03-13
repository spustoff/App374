//
//  BooksViewModel.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI
import CoreData

final class BooksViewModel: ObservableObject {

    @Published var status: [String] = ["New", "In work", "Done", "Check", "Waiting for payment"]
    @Published var currentStatus = "New"

    @Published var bBook: String = ""
    @Published var bAuthor: String = ""
    @Published var bPlot: String = ""
    @Published var bType: String = ""
    @Published var bTime: String = ""
    @Published var bNotes: String = ""
    
    @Published var isAddBook: Bool = false
    @Published var isAddRBook: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var books: [ReadedModel] = []
    @Published var selectedBook: ReadedModel?

    func addBook() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ReadedModel", into: context) as! ReadedModel

        loan.bBook = bBook
        loan.bAuthor = bAuthor
        loan.bPlot = bPlot
        loan.bType = bType
        loan.bTime = bTime
        loan.bNotes = bNotes

        CoreDataStack.shared.saveContext()
    }
    
    func fetchBooks() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ReadedModel>(entityName: "ReadedModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.books = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.books = []
        }
    }
    
    @Published var rAuthor: String = ""
    @Published var rBook: String = ""
    @Published var rPlot: String = ""

    @Published var isReadedBooks: Bool = false

    @Published var rbooks: [BooksModel] = []
    @Published var selectedRBook: BooksModel?

    func addRBook() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "BooksModel", into: context) as! BooksModel

        loan.rAuthor = rAuthor
        loan.rBook = rBook
        loan.rPlot = rPlot

        CoreDataStack.shared.saveContext()
    }
    
    func fetchRBooks() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BooksModel>(entityName: "BooksModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.rbooks = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.rbooks = []
        }
    }
}

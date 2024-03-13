//
//  CoursesViewModel.swift
//  App374
//
//  Created by IGOR on 06/03/2024.
//

import SwiftUI
import CoreData

final class CoursesViewModel: ObservableObject {

    @Published var status: [String] = ["Study now", "Wait list"]
    @Published var currentStatus = "Study now"

    @Published var cStatus: String = ""
    @Published var cTitle: String = ""
    @Published var cDuration: String = ""
    @Published var cType: String = ""
    @Published var cDetails: String = ""
    @Published var cStart: String = ""
    @Published var cNotes: String = ""
    @Published var cCurStatus: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var courses: [CoursesModel] = []
    @Published var selectedCourse: CoursesModel?

    func addCourse() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CoursesModel", into: context) as! CoursesModel

        loan.cStatus = cStatus
        loan.cTitle = cTitle
        loan.cDuration = cDuration
        loan.cType = cType
        loan.cDetails = cDetails
        loan.cStart = cStart
        loan.cNotes = cNotes
        loan.cCurStatus = cCurStatus

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCourses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CoursesModel>(entityName: "CoursesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.courses = result.filter{($0.cCurStatus ?? "") == currentStatus}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.courses = []
        }
    }
}

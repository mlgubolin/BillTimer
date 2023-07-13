//
//  BillController.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 24/07/23.
//

import Foundation
import CoreData

class BillManager: ObservableObject {
    let container = NSPersistentContainer(name: "BillTimer")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully. WUHU!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func createBill(name: String, date: Date, description: String, recurrence: Int16, color: SerializableColor, context: NSManagedObjectContext) {
        
        let bill = Bill(context: context)
        
        bill.id = UUID()
        bill.name = name
        bill.date = date
        bill.billDescription = description
        bill.recurrence = recurrence
        bill.color = color
        bill.createdAt = Date()
        
        save(context: context)
    }
    
    func updateBill(bill: Bill, name: String, date: Date, description: String, recurrence: Int16, color: SerializableColor, context: NSManagedObjectContext) {
        
        bill.name = name
        bill.date = date
        bill.billDescription = description
        bill.recurrence = recurrence
        bill.color = color
        bill.createdAt = Date()
        
        save(context: context)
    }
}

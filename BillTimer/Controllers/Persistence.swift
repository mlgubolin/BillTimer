//
//  Persistence.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 13/07/23.
//

import CoreData
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
//        //MARK: Test data
//        let bill = Bill(context: viewContext)
//        bill.name = "Test Bill"
//        bill.billDescription = "aaaaaaaaa"
//        bill.date = Date(timeIntervalSince1970: 0)
//        bill.recurrence = Int16(1)
//        bill.id = UUID()
//        bill.color = SerializableColor(from: Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2))
        
        //MARK: Save data
        for _ in 0..<10 {
            let newBill = Bill(context: viewContext)
            newBill.createdAt = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    static var testData: [Bill]? = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bill")
        return try? PersistenceController.preview.container.viewContext.fetch(fetchRequest) as? [Bill]
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "BillTimer")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}


// Replace this implementation with code to handle the error appropriately.
// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

/*
 Typical reasons for an error here include:
 * The parent directory does not exist, cannot be created, or disallows writing.
 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
 * The device is out of space.
 * The store could not be migrated to the current model version.
 Check the error message to determine what the actual problem was.
 */

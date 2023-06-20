//
//  BillDataController.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 20/06/23.
//

import CoreData
import Foundation

class BillDataController: ObservableObject {
    let container = NSPersistentContainer(name: "BillModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

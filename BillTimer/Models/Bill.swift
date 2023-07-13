//
//  Bill.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 14/07/23.
//

import Combine
import CoreData


public class Bill: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var date: Date
    @NSManaged public var color: SerializableColor
    @NSManaged public var billDescription: String
    @NSManaged public var recurrence: Int16
    @NSManaged public var createdAt: Date
}


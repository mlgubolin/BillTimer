//
//  BillTimerApp.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 13/07/23.
//

import SwiftUI

@main
struct BillTimerApp: App {
    @StateObject private var billManager = BillManager()

    var body: some Scene {
        WindowGroup {
            BillListView()
                .environment(\.managedObjectContext, billManager.container.viewContext)
        }
    }
}

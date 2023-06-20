//
//  BillTimerApp.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 01/06/23.
//

import SwiftUI

@main
struct BillTimerApp: App {
    @StateObject private var billDataController = BillDataController()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, billDataController.container.viewContext)
        }
    }
}

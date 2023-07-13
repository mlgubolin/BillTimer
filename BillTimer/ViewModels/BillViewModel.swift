//
//  BillViewModel.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 27/06/23.
//
import SwiftUI
import Foundation

extension AddBillView {
    @MainActor
    class BillViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var date = Date()
        @Published var recurrence = 0
        @Published  var bColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
        @Published var description: String = ""
    }
}

//
//  ContentView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()

    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}
struct MultiDatePickerExample: View {
    @State private var dates: Set<DateComponents> = []


    var body: some View {
        MultiDatePicker("Dates Available", selection: $dates)
            .fixedSize()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerExample()
    }
}

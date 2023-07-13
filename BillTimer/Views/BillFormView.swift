//
//  BillFormView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 14/07/23.
//

import SwiftUI

struct BillFormView: View {
    @Binding var name: String
    @Binding var date: Date
    @Binding var recurrence: Int
    @Binding var description: String
    @Binding var color: Color
    
    var emailOptions = ["Weekly", "Bi-Weekly", "Monthly","Bi-Monthly","Semestral","Yearly"]
    var body: some View {
        Form {
            Section(header: Text("Bill")){
                TextField("Bill Name", text: $name)
            }
            .padding(.horizontal, 16)
            Section(header: Text("Date")) {
                DatePicker("Starting Date", selection: $date, displayedComponents: .date)
                Picker(selection: $recurrence, label: Text("Recurrence")) {
                    ForEach(emailOptions.indices, id: \.self) {
                        Text(emailOptions[$0])
                    }
                }
            }
            Section{
                ColorPicker("Choose a color:", selection: $color)
                TextField ("Description", text: $description)
            }
        }
    }
}

struct BillFormViewPreview: PreviewProvider {
    static var previews: some View {
        @State var name = "Nome"
        @State var date = Date()
        @State var recurrence = 0
        @State var description = "AAAAAAA"
        @State var color = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
        BillFormView(name: $name, date: $date, recurrence: $recurrence, description: $description, color: $color)
    }
}

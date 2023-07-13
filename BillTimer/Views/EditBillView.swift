//
//  EditBillView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 23/06/23.
//

import SwiftUI

struct EditBillView: View {
    @Environment(\.managedObjectContext) var managedObj
    @Environment(\.dismiss) var dismiss
    
    var bill : Bill
    @State var name: String = ""
    @State var date = Date()
    @State private var index = 0
    var emailOptions = ["Weekly", "Bi-Weekly", "Monthly","Bi-Monthly","Semestral","Yearly"]
    @State private var bColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State var description: String = ""
    
//    name = bill.name
    
    
    var body: some View {
        Form {
            Section(header: Text("Bill")){
                TextField("Bill Name", text: $name)
            }
            .padding(.horizontal, 16)
            Section(header: Text("Date")) {
                DatePicker("Starting Date", selection: $date, displayedComponents: .date)
                Picker(selection: $index, label: Text("Recurrence")) {
                    ForEach(emailOptions.indices, id: \.self) {
                        Text(self.emailOptions[$0])
                    }
                }
            }
            Section{
                TextField("Description", text: $description)
                ColorPicker("Choose a color:", selection: $bColor)
                
            }
        }
        .toolbar{
            ToolbarItem (placement: .navigationBarTrailing){
                Button{
//                    let bill = Bill(context: managedObj)
                    bill.id = UUID()
                    bill.name = name
                    bill.date = date
                    bill.billDescription = description
                    bill.recurrence = Int16(index)
                    bill.color = SerializableColor(from: bColor)
                    bill.createdAt = Date.now
                    
                    try? managedObj.save()
                    dismiss()
                } label:{
                    Text("Done")
                }
            }
            ToolbarItem (placement: .navigationBarLeading){
                Button{
                } label:{
                    Text("Cancel")
                }
            }
        }
    }

}

//#Preview {
//    EditBillView()
//}

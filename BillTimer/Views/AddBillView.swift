//
//  AddBillView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 05/06/23.
//

import SwiftUI

struct AddBillView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @StateObject private var billVM = BillViewModel()
    let manager = BillManager()
    var isEdit = false
    

    var body: some View {
        BillFormView(name: $billVM.name, date: $billVM.date, recurrence: $billVM.recurrence, description: $billVM.description, color: $billVM.bColor)
        .toolbar{
            ToolbarItem (placement: .navigationBarTrailing){
                Button{
                    save()
                    dismiss()
                } label:{
                    Text("Save")
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
    private func save(){
        manager.createBill(name: billVM.name, date: billVM.date, description: billVM.description, recurrence: Int16(billVM.recurrence), color: SerializableColor(from: billVM.bColor), context: managedObjContext)
    }
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}

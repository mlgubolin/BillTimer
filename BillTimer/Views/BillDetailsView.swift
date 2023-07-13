//
//  BillDetailsView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 20/06/23.
//


import SwiftUI

struct BillDetailsView: View {
    var bill: Bill
    var body: some View {
        VStack {
            Text(bill.name)
                .font(.headline)
                .frame(alignment: .leading)
                .padding(.bottom)
//            Spacer()
            Text((bill.date).formatted())
                .font(.subheadline)
            Text(bill.billDescription)
            Text("\(bill.recurrence)")

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Delete Bill")
            })
            .padding()
        }.toolbar {
            ToolbarItem (placement: .navigationBarTrailing){
                NavigationLink {
                    AddBillView()
                }label: {
                    Text("Edit")
                }
            }
        }
    }
}


struct BillDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BillDetailsView(bill: (PersistenceController.testData?.first)!)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewLayout(.sizeThatFits)

    }
}

//
//  MainView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 01/06/23.
//

import SwiftUI

struct BillListView: View {
    @State var showingAddView: Bool = false
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .forward)]) var bills: FetchedResults<Bill>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    if bills.count == 0{
                        Text("You have no bills!")
                    }
                    else {
                        ForEach(bills){ bill in
                            NavigationLink {
                                EditBillView(bill: bill)
                            }
                        label:{
                            HStack{
                                Text(bill.date.formatted(Date.FormatStyle().day().month()))
                                    .padding(.trailing)
                                Text(bill.name)
                                Spacer()
                                Circle()
                                    .fill(bill.color.color)
                                    .frame(width: 20,height: 20)
                            }
                        }
                        }
                        .onDelete(perform: deleteBill)
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .navigationTitle("iBill")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddBillView()
            }
        }
        .navigationViewStyle(.stack) // Removes sidebar on iPad
    }
    private func deleteBill(offsets: IndexSet) {
        withAnimation {
            offsets.map { bills[$0] }
            .forEach(managedObjContext.delete)
            
            // Saves to our database
            BillManager().save(context: managedObjContext)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
            .previewDevice("iPhone SE (3rd generation)")
        BillListView()
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

//
//  MainView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 01/06/23.
//

import SwiftUI

struct MainView: View {
    @FetchRequest(sortDescriptors: []) var bills: FetchedResults<Bill>
    @State var isShowMenu: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Next Bills")
                        .frame(alignment: .leading)
                    List(bills){ bill in
                        Text(bill.name ?? "None")
                    }
                }
                .disabled(self.isShowMenu)
                .toolbar{
                    ToolbarItem (placement: .navigationBarTrailing){
                        Button{
                            withAnimation{
                                self.isShowMenu.toggle()
                            }
                        } label:{
                            Image(systemName: "gear")
                        }
                    }
                    ToolbarItem (placement: .navigationBarLeading){
                        NavigationLink {
                            AddBillView()
                        } label:{
                            Image(systemName: "plus")
                        }
                    }
                }
                if self.isShowMenu {
                    MenuView()
                        .transition(.move(edge: .bottom))
                        .padding(.top,100)
                }
            }
        }
        .navigationBarTitle("side menu")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //        MainView()
        MainView()
            .previewDevice("iPhone SE (3rd generation)")
        MainView()
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

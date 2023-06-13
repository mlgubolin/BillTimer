//
//  MainView.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 01/06/23.
//

import SwiftUI

struct MainView: View {
    @State var isShowMenu: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                            Button{
                                withAnimation{
                                    self.isShowMenu.toggle()
                                }
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
    }
}

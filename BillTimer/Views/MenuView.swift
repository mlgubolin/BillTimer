//
//  HamburgerMenu.swift
//  BillTimer
//
//  Created by Maria Lucia Gubolin on 05/06/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        GeometryReader{ geometry in
            List {
                HamburgerRow(icon: "gear",name: "Settings")
                HamburgerRow(icon: "questionmark.circle",name: "Help")
                HamburgerRow(icon: "info",name: "Info")
            }
            .listStyle(.plain)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.white)
        }
    }
}

struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct HamburgerRow: View {
    var icon: String
    var name: String
    var body: some View {
        HStack{
            Image(systemName: icon)
            Text(name)
        }
    }
}

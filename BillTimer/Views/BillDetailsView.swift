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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BillDetailsView_Previews: PreviewProvider {
    var bill : Bill
    
    bill.name = "Teste"
    bill.date = Date.now()
    static var previews: some View {
        BillDetailsView()
            .previewLayout(.sizeThatFits)
    }
}

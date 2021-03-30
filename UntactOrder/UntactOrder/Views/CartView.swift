//
//  CartView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/30/21.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var user: User
    
    var menuItem: some View {
        List {
            ForEach(user.cart, id: \.self) { menu in
                Text(menu.name)
                Text(String(menu.count))
            }
        }
    }
    var body: some View {
        VStack {
            Text("가게명")
            menuItem
        }
        
        // menu name
        // menu option
        // extra options
        // menu price + stepper
        // delete menu
        
        // add more
        
        // total price and order
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(User())
    }
}

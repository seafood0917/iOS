//
//  CartView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/30/21.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var user: User
    
    var orderItem: some View {
        List {
            ForEach(user.cart, id: \.self) { order in
                HStack {
                    Text(order.name)
                    Text(String(order.count))
                    Text(String(order.price))
                    Text(order.option)
                }
            }
        }
    }
    var body: some View {
        VStack {
            Text("가게명")
            orderItem
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

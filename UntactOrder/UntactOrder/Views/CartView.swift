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
            if !user.cart.isEmpty {
                VStack {
                    Text("\(user.cart[0].store.name)")
                    orderItem
                }
            } else {
                Text("카트가 비었습니다.")
            }
            
            Spacer()
            
            Text("\(user.totalPrice())원 계산하기")
            
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

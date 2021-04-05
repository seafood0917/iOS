//
//  User.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import Foundation

class User: Identifiable, ObservableObject {
    var name: String = "Dave"
    @Published var cart: [Order] = []
    var card: String = "Visa"
    
    func addToCart(order: Order) {
        if !self.cart.isEmpty {
            if self.cart[0].storeID != order.storeID {
                print("Only can add menus from the same store.")
                print("Do you want to replace?")
                if true {
                    self.cart = [order]
                } else {
                    print("Do nothing.")
                }
            } else {
                if self.cart.contains(order) {
                    print("Contain")
                    if let index = self.cart.firstIndex(of: order) {
                        self.cart[index].count += order.count
                        self.cart[index].price += order.price
                    }
                } else {
                    self.cart.append(order)
                    print("Not contain")
                    
                }
            }
        } else {
            self.cart.append(order)
            print("Empty")
        }
    }
    
    func totalPrice() -> Int {
        var total: Int = 0
        for order in self.cart {
            total += order.price
        }
        return total
    }
}




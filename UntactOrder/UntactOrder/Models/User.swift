//
//  User.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import Foundation

class User: Identifiable, ObservableObject {
    var name: String = "Dave"
    @Published var cart: [Menu] = []
    var card: String = "Visa"
    
    func addToCart(menu: Menu) {
        if !self.cart.isEmpty {
            if self.cart[0].storeID != menu.storeID {
                print("Only can add menus from the same store.")
                print("Do you want to replace?")
                if true {
                    self.cart = [menu]
                } else {
                    print("Do nothing.")
                }
            } else {
                if self.cart.contains(menu) {
                    print("Contain")
                    if let index = self.cart.firstIndex(of: menu) {
                        self.cart[index].count += menu.count
                    }
                }
            }
        } else {
            self.cart.append(menu)
            print("Not contain")
        }
    }
}

func CheckOut() {
    
}


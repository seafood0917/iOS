//
//  Order.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/30/21.
//

import Foundation

struct Order {
    var id: UUID
    var count: Int
    var option: String
    // store's UUID to check if a user add a menu from the same store.
//    var storeID: UUID
    var price: Int
    
    var name: String
//    var description: String
//    var photo: Image
    init(id: UUID = UUID(), count: Int = 0,
         option: String = "", price: Int = 0,
         name: String = "") {
        self.id = id
        self.count = count
        self.option = option
        self.price = price
        self.name = name
    }
}

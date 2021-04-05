//
//  Order.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/30/21.
//

import Foundation

class Order: Identifiable, Hashable, ObservableObject {
    var storeID: UUID
    
    // Hashable conform
    static func == (lhs: Order, rhs: Order) -> Bool {
        (lhs.id == rhs.id) && (lhs.option == rhs.option)
//        lhs.storeID == rhs.storeID
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.name)
            hasher.combine(self.option)
        }
    // -------
    
    var store: Store
    var id: UUID
    var count: Int
    var option: String
    // store's UUID to check if a user add a menu from the same store.
    
    var price: Int
    
    var name: String
//    var description: String
//    var photo: Image
    init(store: Store = Store(), id: UUID = UUID(), count: Int = 100,
         option: String = "", storeID: UUID = UUID(),
         price: Int = -100, name: String = "") {
        self.store = store
        self.id = id
        self.count = count
        self.option = option
        self.storeID = storeID
        self.price = price
        self.name = name
    }
}

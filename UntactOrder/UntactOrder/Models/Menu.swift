//
//  Menu.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import Foundation
import SwiftUI

class Menu: Identifiable, Hashable {
    
    
    // Hashable conform
    static func == (lhs: Menu, rhs: Menu) -> Bool {
        (lhs.id == rhs.id) && (lhs.option == rhs.option)
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.name)
            hasher.combine(self.option)
        }
    // -------
    
    
    var id: UUID
//    var count: Int
    var option: String
    // store's UUID to check if a user add a menu from the same store.
    var storeID: UUID
    var price: Int
    
    var name: String
    var description: String
    var photo: Image
    
    
    init(id: UUID = UUID(), storeID: UUID = UUID(), price: Int = 20000,
         name: String = "Chicken",
         description: String = "Spicy", photo: Image = Image("chicken"),
         option: String = "Extra Radish") {
        self.id = id
        self.storeID = storeID
        self.price = price
//        self.count = count
        self.name = name
        self.description = description
        self.photo = photo
        self.option = option
       
    }
}


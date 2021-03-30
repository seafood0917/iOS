//
//  Restaurant.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import Foundation
import SwiftUI

class Store: ObservableObject, Identifiable, Equatable {
    static func == (lhs: Store, rhs: Store) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UUID
    var name: String
    var location: String
    var review: [String]
    var photo: Image
    @Published var menus: [Menu]
    
    init(id: UUID = UUID(), name: String = "BBQ",
         location: String = "1123 st", review: [String] = ["good"],
         photo: Image = Image("bolt.fill"), menus: [Menu] = []) {
        self.id = id
        self.name = name
        self.location = location
        self.review = review
        self.photo = photo
        self.menus = menus
        self.addMenu(menu: Menu())
    }
    
    func addMenu(menu: Menu) {
        menu.storeID = self.id
        self.menus.append(menu)
    }
}

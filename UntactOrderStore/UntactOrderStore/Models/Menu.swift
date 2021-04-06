//
//  Menu.swift
//  UntactOrderStore
//
//  Created by Daesik Choi on 4/6/21.
//

import Foundation

class Menu: ObservableObject, Hashable {
    static func == (lhs: Menu, rhs: Menu) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.option)
    }
    
    var id: UUID
    @Published var price: String
    @Published var name: String
    @Published var option: String
    @Published var description: String
    
    init(id: UUID = UUID(), price: String = "", name: String = "",
         option: String = "", description: String = "") {
        self.id = id
        self.price = price
        self.name = name
        self.option = option
        self.description = description
    }
    
    
}

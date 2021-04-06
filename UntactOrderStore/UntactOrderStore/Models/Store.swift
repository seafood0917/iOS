//
//  Store.swift
//  UntactOrderStore
//
//  Created by Daesik Choi on 4/6/21.
//

import Foundation

class Store: ObservableObject {
    @Published var menuList: [Menu]
    var storeName: String
    var rate: Double
    
    init(menuList: [Menu] = [], storeName: String = "Store Name",
         rate: Double = 0.0) {
        self.menuList = menuList
        self.storeName = storeName
        self.rate = rate
    }
    
    func addMenu(menu: Menu) {
        self.menuList.append(menu)
    }
}

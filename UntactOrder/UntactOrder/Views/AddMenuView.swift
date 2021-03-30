//
//  AddItemView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var user: User
    var menu1: Menu = Menu()
    var menu2: Menu = Menu()
    var menu3: Menu = Menu()
    @ObservedObject var store1: Store = Store(name: "KK")
    @ObservedObject var store2: Store = Store(name: "TT")
    
    var body: some View {
        VStack {
            Button(action: {
                store1.addMenu(menu: menu1)
                store2.addMenu(menu: menu2)
                store2.addMenu(menu: menu3)
            }, label: {
                Text("Button")
            })
            
            if !store1.menus.isEmpty {
                Text(store1.menus[0].name)
            } else {
                Text("empty")
            }
            
            Button(action: {
                user.addToCart(menu: menu1)
            }, label: {
                Text("add menu1")
            })
            
            Button(action: {
                user.addToCart(menu: menu2)
            }, label: {
                Text("add menu2")
            })
            
            Button(action: {
                user.addToCart(menu: menu3)
            }, label: {
                Text("add menu3. menu2 and menu3 are from the same store")
            })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView().environmentObject(User())
    }
}

//
//  MenuView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/30/21.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var user: User
    var store: Store
    var body: some View {
        VStack {
            Text(store.name)
            List {
                ForEach(store.menus, id: \.self) { menu in
                    NavigationLink(destination: ItemView(menu: menu)) {
                        Text(menu.name)
                    }
                }
            }
            NavigationLink(
                destination: CartView(),
                label: {
                    Text("CartView")
                })
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(store: Store()).environmentObject(User())
    }
}

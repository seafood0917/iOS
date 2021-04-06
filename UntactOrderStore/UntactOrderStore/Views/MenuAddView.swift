//
//  MenuAddView.swift
//  UntactOrderStore
//
//  Created by Daesik Choi on 4/6/21.
//

import SwiftUI

struct MenuAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var menu: Menu = Menu()
    @ObservedObject var store: Store = Store()
    var body: some View {
        VStack {
            Text("Menu Image")
            TextField("Menu name", text: $menu.name)
            TextField("Menu description", text: $menu.description)
            TextField("Menu price", text: $menu.price)
            
            Spacer()
            Text("Menu options")
            
            
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                self.store.addMenu(menu: menu)
                print("Add menu")
            }, label: {
                Text("Add")
            })
        }
    }
}

struct MenuAddView_Previews: PreviewProvider {
    static var previews: some View {
        MenuAddView()
    }
}

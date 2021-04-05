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
    @State var sheet: Bool = false
    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack {
                    Text(store.name)
                    List {
                        ForEach(store.menus, id: \.self) { menu in
                            //                    NavigationLink(destination: ItemView(menu: menu, store: store)) {
                            //                        Text(menu.name)
                            Button(action: {
                                self.sheet = true
                            }, label: {
                                Text(menu.name)
                            })
                            .fullScreenCover(isPresented: self.$sheet, content: {
                                ItemView.init(menu: menu, store: store)
                            })
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: CartView(),
                            label: {
                                Text("Cart")
                                    .font(.system(.largeTitle))
                                    .foregroundColor(.white)
                                    .frame(width: reader.size.width / 4, height: reader.size.height / 7, alignment: .center)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .padding()
                        })
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                    }
                }
            }
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(store: Store()).environmentObject(User())
    }
}

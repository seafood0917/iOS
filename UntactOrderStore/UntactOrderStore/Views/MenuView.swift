//
//  MenuView.swift
//  UntactOrderStore
//
//  Created by Daesik Choi on 4/6/21.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var store: Store = Store()
    @State var isSheet: Bool = false
    var body: some View {
        VStack {
            Text("가게명")
            ZStack {
                List {
                    ForEach(store.menuList, id: \.self) { menu in
                        HStack {
                            Text(menu.name)
                            Text(menu.price)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Go to menu add view.")
                            self.isSheet = true
                        }, label: {
                            Text("Button")
                                .foregroundColor(.white)
                        })
                        .fullScreenCover(isPresented: self.$isSheet , content: {
                            MenuAddView.init(store: store)
                        })
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding()
                    }
                }
                
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

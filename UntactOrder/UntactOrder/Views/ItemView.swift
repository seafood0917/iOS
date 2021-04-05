//
//  ItemView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentationMode
    var menu: Menu
    var store: Store
    @State var order: Order = Order()
    @State var count: Int = 1
    @State var price: Int = 0
    
    var getPrice: some View {
        Text(String(menu.price) +  "원")
        
    }
    var getTotalPrice: some View {
        HStack {
            Text("총 가격: ")
            Text(String(self.price + self.menu.price) + "원")
        }
    }
    var stepper: some View {
        HStack {
            Text("수량")
            Button(action: {
                self.count -= 1
                self.price -= menu.price
            }, label: {
                Text("-")
            })
            .disabled(self.count == 1)
            
            Text(String(count))
            Button(action: {
                self.count += 1
                self.price += menu.price
            }, label: {
                Text("+")
            })
        }
        
    }
    
    var cancel: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("< Back")
                    .bold()
            })
            .padding()
            
            Spacer()
        }
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                cancel
                
                Group {
                    menu.photo
                        .resizable()
                        .frame(width: reader.size.width * 0.8, height: reader.size.height * 0.2, alignment: .center)
                    Text(menu.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    Text(menu.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    getPrice
                }
                Spacer()
                // Show options
                TextField("Option:", text: self.$order.option)
                
                Spacer()
                
                stepper
                
                getTotalPrice
                
                Button(action: {
                    self.order.store = self.store
                    self.order.id = self.menu.id
                    self.order.count = self.count
                    self.order.price = self.price + self.menu.price
                    self.order.name = self.menu.name
                    self.order.storeID = self.menu.storeID
                    
                    user.addToCart(order: self.order)
                    print("add to cart")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add to Cart")
                        .bold()
                        .foregroundColor(.green)
                        .font(.title3)
                        .padding()
                })
                .border(Color.blue, width: 10)
                .cornerRadius(15)
                .padding()
            }
            .frame(width: reader.size.width, height: reader.size.height)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(menu: Menu(), store: Store())
            .environmentObject(User())
    }
}

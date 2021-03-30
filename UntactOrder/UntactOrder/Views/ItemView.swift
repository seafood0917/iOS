//
//  ItemView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/26/21.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var user: User
    var menu: Menu = Menu()
    @State var count: Int = 1
    var getPrice: some View {
        Text(String(menu.price) +  "원")
        
    }
    var getTotalPrice: some View {
        HStack {
            Text("총 가격: ")
//            Text(String(menu.totalPrice) + "원")
        }
    }
    var stepper: some View {
        HStack {
            Text("수량")
            Button(action: {
                self.count -= 1
//                menu.totalPrice -= menu.price
            }, label: {
                Text("-")
            })
            .disabled(self.count < 1)
            
            Text(String(count))
            Button(action: {
                self.count += 1
//                menu.totalPrice += menu.price
            }, label: {
                Text("+")
            })
        }
        
    }
    var body: some View {
        GeometryReader { reader in
            VStack {
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
                Spacer()
                // Show options
//                TextField("Option:", text: $menu.option)
                
                Spacer()
                
                stepper
                
                getTotalPrice
                
                Button(action: {
                    print("add to cart")
                    user.addToCart(menu: menu)
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
        ItemView()
            .environmentObject(User())
    }
}

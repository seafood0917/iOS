//
//  ButtonView.swift
//  demo
//
//  Created by Bigluck on 2020/12/02.
//

import SwiftUI

struct ButtonView: View {
    let foodPrinter: () -> () = {
        print("The food was so good!🐟")
    }
  
    var body: some View {
      VStack {
        Button("Make Meow!") {
          print("😻Meeeeeeow!😻")
        }
        
        Button(action: foodPrinter) {
          VStack {
            Image("Cat")
                .resizable()
                .scaledToFit()
                .shadow(radius: 30)
                
            
            Text("Feed Cat!")
                .bold()
                .padding()
                .background(Color.purple)
                .foregroundColor(.primary)
                .cornerRadius(15)
                .shadow(radius: 10)
                
                
            
          }
        }
      }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView()
            ButtonView()
                .colorScheme(.dark)
        }
       
    }
}

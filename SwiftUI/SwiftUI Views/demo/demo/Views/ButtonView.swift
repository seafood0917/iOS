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
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
            
            Text("Feed Cat!")
            
          }
        }
      }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

//
//  Documentation.swift
//  demo
//
//  Created by Bigluck on 2020/12/02.
//

import SwiftUI

struct Documentation: View {
    var body: some View {
        ZStack {
            VStack {
                Image("SquaredCat")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("😻 Meow! 😻")
                    .font(Font.system(.largeTitle, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: Color.black, radius: 10, x: 10, y: 10)
                    .rotationEffect(Angle(degrees: -10))
            }
            Spacer()
                .layoutPriority(1)
        }
        .background(Color.rayWenderlichGreen)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Documentation_Previews: PreviewProvider {
    static var previews: some View {
        Documentation()
    }
}

// Everyone's favorite color
extension Color {
    static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}

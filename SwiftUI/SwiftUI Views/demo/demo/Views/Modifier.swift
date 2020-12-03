//
//  SwiftUIView.swift
//  demo
//
//  Created by Bigluck on 2020/12/03.
//

import SwiftUI

struct Modifier: View {
    var body: some View {
        Text("Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!")
          .lineLimit(2)
          .minimumScaleFactor(0.5)
          .multilineTextAlignment(.center)
          .truncationMode(.middle)
          .foregroundColor(Color.red)
          .padding()
          .background(Color.gray)
          .border(Color.black, width: 3)
    }
}

struct Modifier_Previews: PreviewProvider {
    static var previews: some View {
        Modifier()
    }
}

//
//  Image.swift
//  demo
//
//  Created by Bigluck on 2020/12/02.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
      Image("Ray")
        .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
        .scaledToFill()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ImageView()
      }
    }
}

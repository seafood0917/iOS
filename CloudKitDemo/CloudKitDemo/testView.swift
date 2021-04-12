//
//  testView.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/10/21.
//

import SwiftUI

struct testView: View {
    @State var tt: [String]
    var body: some View {
        List(tt, id: \.self) { a in
            Text(a)
        }
        .onAppear() {
            tt.append("Test")
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView(tt: ["TTT", "sss"])
    }
}

//
//  ContentView.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var test: [String] = []
    @State var te: String = "te"
    var body: some View {
        NavigationView {
            VStack {
                Text("dfasdf")
                Button(action: {
                    if te == "te" {
                        test.append("yyyyy")
                        te = "no"
                    } else {
                        test.append("xxxxx")
                        te = "te"
                    }
                }, label: {
                    if te == "te" {
                        Text(te)
                    } else {
                        Text("NOOOOO")
                    }
                })
                NavigationLink(destination: testView(tt: test)) {
                    Text("dfasdf")
                }
                
                Text("dfasdf")
                Text("dfasdf")
                Text("dfasdf")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

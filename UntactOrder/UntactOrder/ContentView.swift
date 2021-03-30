//
//  ContentView.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: User
    var store: Store = Store()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("home")
                NavigationLink(destination: MenuView(store: store), label: {
                    Text("BBQ")
                })
//                MenuView(store: store)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}

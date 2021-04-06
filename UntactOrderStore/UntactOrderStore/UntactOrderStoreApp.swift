//
//  UntactOrderStoreApp.swift
//  UntactOrderStore
//
//  Created by Daesik Choi on 4/6/21.
//

import SwiftUI

@main
struct UntactOrderStoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

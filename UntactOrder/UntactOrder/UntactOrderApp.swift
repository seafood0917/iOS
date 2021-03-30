//
//  UntactOrderApp.swift
//  UntactOrder
//
//  Created by Daesik Choi on 3/25/21.
//

import SwiftUI

@main
struct UntactOrderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(User())
        }
    }
}

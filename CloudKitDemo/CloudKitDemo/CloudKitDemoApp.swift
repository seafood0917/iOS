//
//  CloudKitDemoApp.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/7/21.
//

import SwiftUI

@main
struct CloudKitDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

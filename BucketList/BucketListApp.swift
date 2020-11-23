//
//  BucketListApp.swift
//  BucketList
//
//  Created by Rafael Calunga on 2020-11-23.
//

import SwiftUI

@main
struct BucketListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

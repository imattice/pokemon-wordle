//
//  MainApp.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

@main
struct MainApp: App {
    let persistenceController: PersistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppSettingsScreen()
            }
            .navigationBarTitleDisplayMode(.inline)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

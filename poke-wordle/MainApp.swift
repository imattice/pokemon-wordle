//
//  MainApp.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

@main
struct MainApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GameHistory()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

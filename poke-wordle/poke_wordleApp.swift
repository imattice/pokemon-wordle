//
//  poke_wordleApp.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

@main
struct poke_wordleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

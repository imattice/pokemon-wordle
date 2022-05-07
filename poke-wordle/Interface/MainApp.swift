//
//  MainApp.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppSettingsScreen()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

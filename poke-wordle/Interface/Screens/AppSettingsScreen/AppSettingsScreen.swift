//
//  AppSettingsScreen.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

struct AppSettingsScreen: View {
    var body: some View {
        List {
            GameplaySection()
            NotificationSection()
            MeasurementPreferenceSection()
        }
        .listStyle(.grouped)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsScreen()
    }
}

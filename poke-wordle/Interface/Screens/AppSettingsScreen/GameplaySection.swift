//
//  GameplaySection.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/3/22.
//

import SwiftUI

extension AppSettingsScreen {
    struct GameplaySection: View {
        var body: some View {
            Section(
                content: {
                    NavigationLink(l10n.AppSettings.Gameplay.Cell.Title.starter,
                                   destination: StarterSelectionScreen())
                    NavigationLink(l10n.AppSettings.Gameplay.Cell.Title.history,
                                   destination: GameHistoryScreen())
                },
                header: { Text(l10n.AppSettings.Gameplay.header) })
        }
    }
}

struct GameplaySection_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsScreen.GameplaySection()
    }
}

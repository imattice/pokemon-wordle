//
//  GameHistoryScreen.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import SwiftUI
import CoreData

struct GameHistoryScreen: View {
    let games: [Game] = GameManager.shared.gameHistory

    var body: some View {
        List(games, id: \.self) { game in

        }
    }
}

struct GameHistory_Previews: PreviewProvider {
    static var previews: some View {
        GameHistoryScreen()
    }
}

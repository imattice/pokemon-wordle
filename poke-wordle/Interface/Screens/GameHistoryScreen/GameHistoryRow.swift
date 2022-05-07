//
//  GameHistoryRow.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/5/22.
//

import SwiftUI

struct GameHistoryRow: View {
    let game: Game

    var iconName: String {
        game.didSolve ? game.hiddenPokemon.name : "unknown"
    }

    var gameResultIcon: Image {
        if game.guesses.isEmpty == false {
            if game.didSolve {
                return Image("Success")
            }
            return Image("Failure")
        }

        return Image("Unknown")
    }

    var body: some View {
        HStack {
            VStack {
                Text(game.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                TitledIcon(name: iconName)
            }
            Spacer()
            gameResultIcon
        }
    }
}

struct GameHistoryRow_Previews: PreviewProvider {
    static let game: Game = PreviewDataManager.game

    static var previews: some View {
        GameHistoryRow(game: game)
    }
}

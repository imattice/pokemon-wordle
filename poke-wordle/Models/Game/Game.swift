//
//  Game.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/4/22.
//

import Foundation

struct Game {
    let id: UUID
    let date: Date
    let hiddenPokemon: Pokemon
    var guessStatus: GuessStatus
    let maxGuesses: Int
    var guesses: [Pokemon]

    var didSolve: Bool {
        guessStatus.generation == .success &&
        guessStatus.typeOne == .success &&
        guessStatus.typeTwo == .success &&
        guessStatus.height == .success &&
        guessStatus.weight == .success
    }
}

extension Game: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hiddenPokemon)
        hasher.combine(date)
        hasher.combine(maxGuesses)
    }
}

extension Game: Equatable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
}

extension Game {
    struct GuessStatus: Codable {
        var generation: GuessResult = .unknown
        var typeOne: GuessResult = .unknown
        var typeTwo: GuessResult = .unknown
        var height: GuessResult = .unknown
        var weight: GuessResult = .unknown
    }
}

extension Game {
    struct GameResponse {
        let index: Int
        let date: Date
        let maxGuesses: Int
    }
}

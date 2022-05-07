//
//  GameRecord.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/6/22.
//

import Foundation

/// A storage object for a Game
struct GameRecord: Codable {
    let id: String
    let hiddenIndex: Int
    let date: String
    let guessStatus: GuessStatus
    let maxGuessCount: Int
    let guessIndexes: [Int]

    private var dateFormat: String = "yyyy-MM-dd"

    private var convertedId: UUID {
        UUID(uuidString: id) ?? UUID()
    }
    private var convertedDate: Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = dateFormat

        guard let converted: Date = formatter.date(from: date) else {
            fatalError("Invalid format when hydrating date '\(date)' for game id \(id)")
        }

        return converted
    }
    private var convertedPokemon: Pokemon {
        guard let pokemon: Pokemon = DataSource.shared.pokemon(with: hiddenIndex) else {
            fatalError("Could not locate index \(hiddenIndex) in data source \(DataSource.shared.pokemon.map({ $0.id }))")
        }
        return pokemon
    }
    private var convertedGuessStatus: Game.GuessStatus {
        Game.GuessStatus(
            generation: GuessResult(from: guessStatus.generation),
            typeOne: GuessResult(from: guessStatus.typeOne),
            typeTwo: GuessResult(from: guessStatus.typeTwo),
            height: GuessResult(from: guessStatus.height),
            weight: GuessResult(from: guessStatus.weight))
    }
    private var convertedGuesses: [Pokemon] {
        guessIndexes.compactMap { DataSource.shared.pokemon(with: $0) }
    }

    init(game: Game) {
        self.id = game.id.uuidString
        self.hiddenIndex = game.hiddenPokemon.id
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = dateFormat
        self.date = formatter.string(from: game.date)
        self.guessStatus = GuessStatus(
            generation: game.guessStatus.generation.label,
            typeOne: game.guessStatus.typeOne.label,
            typeTwo: game.guessStatus.typeTwo.label,
            height: game.guessStatus.height.label,
            weight: game.guessStatus.weight.label)
        self.maxGuessCount = game.maxGuesses
        self.guessIndexes = game.guesses.map { $0.id }
    }

    func game() -> Game {
        Game(
            id: convertedId,
            date: convertedDate,
            hiddenPokemon: convertedPokemon,
            guessStatus: convertedGuessStatus,
            maxGuesses: maxGuessCount,
            guesses: convertedGuesses)
        }
}

extension GameRecord {
    struct GuessStatus: Codable {
        let generation: String
        let typeOne: String
        let typeTwo: String
        let height: String
        let weight: String
    }
}

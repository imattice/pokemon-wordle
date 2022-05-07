//
//  GameManager.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/5/22.
//

import Foundation

class GameManager {
    static let shared: GameManager = GameManager()

    var currentGame: Game?
    var gameHistory: [Game] = []

    init() {
        loadGames()
    }

    func loadGames() {
        if gameHistory.isEmpty {
            gameHistory = loadLocalData()

//            if gameHistory.isEmpty {
//                fetchGameHistory()
//            }
        }
    }

    // TODO: Ensure raw game data cannot be found in the file system
    func saveToFile() {
        let records: [GameRecord] = gameHistory.map { GameRecord(game: $0) }
        var data: Data?  {
            do {
                return try JSONEncoder().encode(records)
            } catch {
                print(error)
            }
            return nil
        }

        do {
            let path = FileManager.default.urls(for: .documentDirectory,
                                                in: .userDomainMask)[0].appendingPathComponent("SavedGames")
            try data?.write(to: path)
        } catch {
            print(error)
        }
        return
    }

    func loadLocalData() -> [Game] {
        guard let data: Data = JSONHelper.readLocalFile(forName: "MockGameRecords") else {
            print("Failed to read data from MockGameRecords")
            return [Game]()
        }
        do {
            let decoded: [GameRecord] = try JSONDecoder().decode([GameRecord].self, from: data)
            return decoded.map { $0.game() }
        } catch {
            print("could not decode: \(error)")
        }
        return [Game]()
    }
}

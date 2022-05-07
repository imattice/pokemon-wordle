//
//  PreviewDataManager.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/6/22.
//

import Foundation

enum PreviewDataManager {
    static var datasource: [Pokemon] {
        guard let data: Data = JSONHelper.readLocalFile(forName: "MockDataSource", in: .main) else {
            fatalError("Failed to create data from file")
        }

        do {
            let decoded: [Pokemon] = try JSONDecoder().decode([Pokemon].self, from: data)
                return decoded
        } catch {
            fatalError("failed to create json from data with error: \(error)")
        }
    }

    static var games: [Game] {
        guard let data: Data = JSONHelper.readLocalFile(forName: "MockGameRecords", in: .main) else {
            fatalError("Failed to read data from LocalGameRecord")
        }
        do {
            let decoded: [GameRecord] = try JSONDecoder().decode([GameRecord].self, from: data)
            return decoded.map { $0.game() }
        } catch {
            print("could not decode: \(error)")
        }
        fatalError("Failed to parse GameRecords from data")
    }

    static var game: Game {
        guard let game = games.first else {
            fatalError("Failed to get first game")
        }
        return game
    }
}

//
//  DataSource.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/2/22.
//

import Foundation

class DataSource {
    static let shared: DataSource = DataSource()

    let version: Int
    let lastUpdated: Date
    let pokemon: [Pokemon]

    init() {
        self.version = 0
        self.lastUpdated = Date()
        guard let data: Data = JSONHelper.readLocalFile(forName: "LocalDataSource"),
              let decoded: [Pokemon] = try? JSONDecoder().decode([Pokemon].self, from: data) else {
            self.pokemon = [Pokemon]()
            return
        }
        self.pokemon = decoded
    }
}

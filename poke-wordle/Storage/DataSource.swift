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
        // TODO: Update to correct storage
        self.pokemon = PreviewDataManager.datasource
    }

    func pokemon(with index: Int) -> Pokemon? {
        return pokemon.first { $0.id == index }
    }
}

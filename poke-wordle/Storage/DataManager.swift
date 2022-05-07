//
//  DataManager.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/5/22.
//

import Foundation

enum DataManager {
    enum DataSource {
        /// Fetches the data source from the API
        /// - Returns: A collection of Pokemon fetched from the API, or a network error
        private static func fetch() -> Result<[Pokemon], Error> {
            // FIXME: Update to endpoint
            return .success(fetchLocal())
        }

        private static func fetchLocal() -> [Pokemon] {
            guard let data: Data = JSONHelper.readLocalFile(forName: "LocalDataSource"),
                  let decoded: [Pokemon] = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                return [Pokemon]()
            }

            return decoded
        }

        static func save() {
        }
    }
}

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
            return .success(PreviewDataManager.datasource)
        }
        
        static func save() {
        }
    }
}

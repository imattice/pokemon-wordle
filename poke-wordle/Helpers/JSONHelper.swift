//
//  JSONHelper.swift
//  poke-wordleTests
//
//  Created by Ike Mattice on 5/2/22.
//

import Foundation

enum JSONHelper {
    static func readLocalFile(forName name: String, in bundle: Bundle = .main) -> Data? {
        do {
            if let bundlePath: String = bundle.path(forResource: name, ofType: "json"),
               let jsonData: Data = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }
}

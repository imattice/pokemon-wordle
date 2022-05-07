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
            guard  let bundlePath: String = bundle.path(forResource: name, ofType: "json") else {
                print("failed to build path for resource '\(name)'")
                return nil
            }
            guard let jsonData: Data = try String(contentsOfFile: bundlePath).data(using: .utf8) else {
                print("failed to build data from file contents")
                return nil
                }
            return jsonData
        } catch {
            print(error)
        }

        return nil
    }
}

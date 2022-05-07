//
//  GuessResult.swift
//  poke-wordle
//
//  Created by Ike Mattice on 5/5/22.
//

import Foundation

enum GuessResult: Codable {
    case success
    case failure
    case high
    case low
    case unknown
}

extension GuessResult {
    var label: String {
        switch self {
        case .success:
            return "success"
        case .failure:
            return "failure"
        case .high:
            return "high"
        case .low:
            return "low"
        case .unknown:
            return "unknown"
        }
    }

    init(from string: String) {
        switch string.lowercased() {
        case "success":
            self = .success

        case "failure":
            self = .failure

        case "high":
            self = .high

        case "low":
            self = .low

        case "unknown":
            self = .unknown

        default:
            fatalError("invalid string to initialize \(String(describing: GuessResult.self)): '\(string)'")
        }
    }
}

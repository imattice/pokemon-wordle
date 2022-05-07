//
//  GameRecordTests.swift
//  poke-wordleTests
//
//  Created by Ike Mattice on 5/6/22.
//

import XCTest
@testable import poke_wordle

class GameRecordTests: XCTestCase {
    let dataSourceFileName: String = "MockGameRecords"

    var sampleData: [GameRecord] = [GameRecord]()

    override func setUp() {
        super.setUp()
        guard let localData: Data = JSONHelper.readLocalFile(
            forName: dataSourceFileName, in: .main) else {
            XCTFail("Could not parse JSON from local file \(dataSourceFileName)")
            return
        }

        do {
            self.sampleData = try JSONDecoder().decode([GameRecord].self,
                                                       from: localData)
        } catch {
            XCTFail("Failed to parse Pokemon from local data with error:\n\(error)")
        }
    }

    override func tearDown() {
        super.tearDown()
        sampleData.removeAll()
    }

    func testInit() {
        XCTAssert(sampleData.isEmpty == false)
    }

    func testGameConverterMethod() {
        guard let gameRecord: GameRecord = sampleData.first else {
            XCTFail("No first in sample data")
            return
        }

        _ = gameRecord.game()
    }
}

//
//  PokemonTests.swift
//  poke-wordleTests
//
//  Created by Ike Mattice on 5/2/22.
//

import XCTest
@testable import poke_wordle

class PokemonTests: XCTestCase {
    let dataSourceFileName: String = "SampleDataSource"

    var sampleData: [Pokemon] = [Pokemon]()

    override func setUp() {
        super.setUp()
        guard let localData: Data = JSONHelper.readLocalFile(forName: dataSourceFileName,
                                                             in: Bundle(for: type(of: self))) else {
            XCTFail("Could not parse JSON from local file \(dataSourceFileName)")
            return
        }

        do {
            self.sampleData = try JSONDecoder().decode([Pokemon].self,
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

    func testIdLabel() {
        guard let first = sampleData.first else {
            XCTFail("Failed to find a a first item in sample data")
            return
        }
        var expectedLabel: String {
            let id: Int = first.id
            if id < 10 {
                return "00\(id)"
            } else if id >= 10 && id < 100 {
                return "0\(id)"
            } else {
                return String(id)
            }
        }

        XCTAssertEqual(first.idLabel, expectedLabel)
    }

    func testMetricWeightLabel() {
        guard let first = sampleData.first else {
            XCTFail("Failed to find a a first item in sample data")
            return
        }
        UserPreference.weightUnitPreference = .metric
        let bulbasaurWeight: String = "6.9kg"

        XCTAssertEqual(first.weightLabel, bulbasaurWeight)
    }
    func testUSWeightLabel() {
        guard let first = sampleData.first else {
            XCTFail("Failed to find a a first item in sample data")
            return
        }
        UserPreference.weightUnitPreference = .unitedStates
        let bulbasaurWeight: String = "15.2 lb"

        XCTAssertEqual(first.weightLabel, bulbasaurWeight)
    }
    func testMetricHeightLabel() {
        guard let first = sampleData.first else {
            XCTFail("Failed to find a a first item in sample data")
            return
        }
        UserPreference.heightUnitPreference = .metric
        let bulbasaurHeight: String = "0.7m"

        XCTAssertEqual(first.heightLabel, bulbasaurHeight)
    }
    func testUSHeightLabel() {
        guard let first = sampleData.first else {
            XCTFail("Failed to find a a first item in sample data")
            return
        }
        UserPreference.heightUnitPreference = .unitedStates
        let bulbasaurHeight: String = "2′ 4″"

        XCTAssertEqual(first.heightLabel, bulbasaurHeight)
    }
}

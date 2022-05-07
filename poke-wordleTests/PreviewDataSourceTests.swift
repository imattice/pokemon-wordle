//
//  PreviewDataSourceTests.swift
//  poke-wordleTests
//
//  Created by Ike Mattice on 5/6/22.
//

import XCTest
@testable import poke_wordle

class PreviewDataSourceTests: XCTestCase {
    func testDataSource() {
        XCTAssert(PreviewDataManager.datasource.isEmpty == false)
    }

    func testGames() {
        XCTAssert(PreviewDataManager.games.isEmpty == false)
    }
}

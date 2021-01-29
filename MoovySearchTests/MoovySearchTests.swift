//
//  MoovySearchTests.swift
//  MoovySearchTests
//
//  Created by Clerin on 1/28/21.
//

import XCTest
@testable import MoovySearch

class MoovySearchTests: XCTestCase {
    func testExample() throws {
        let viewModel = MovieSearchViewModel()
        let expectation = XCTestExpectation(description: "my test")

        // Add test of func getImdbRating(index: Int) -> UIImage here!

        wait(for: [expectation], timeout: 1.0)
    }

    func testOMDBURL() throws {
        XCTAssertEqual(URLFormatter.omdbURL(for: "the thing"), URL(string: "http://www.omdbapi.com/?t=The+thing&apikey=f39816a8"))
    }
}

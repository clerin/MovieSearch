//
//  MoovySearchTests.swift
//  MoovySearchTests
//
//  Created by Clerin on 1/28/21.
//

import XCTest
@testable import MoovySearch

class MoovySearchTests: XCTestCase {
    
   
    func testRatingOfOne() throws {
        let viewModel = MovieSearchViewModel()
        if let mockMovieData = getStubData(fileName: "movie1"){
            viewModel.movieList = [mockMovieData]
        }
        let imageNameForRatingThree = viewModel.getImdbRatingImageName(index: 0)
        XCTAssertEqual(imageNameForRatingThree, "1")
    }
    
    func testRatingOfTwo() throws {
        let viewModel = MovieSearchViewModel()
        if let mockMovieData = getStubData(fileName: "movie2"){
            viewModel.movieList = [mockMovieData]
        }
        let imageNameForRatingThree = viewModel.getImdbRatingImageName(index: 0)
        XCTAssertEqual(imageNameForRatingThree, "2")
    }
    
    func testRatingOfThree() throws {
        let viewModel = MovieSearchViewModel()
        if let mockMovieData = getStubData(fileName: "movie3"){
            viewModel.movieList = [mockMovieData]
        }
        let imageNameForRatingThree = viewModel.getImdbRatingImageName(index: 0)
        XCTAssertEqual(imageNameForRatingThree, "3")
    }
     
    func testOMDBURL() throws {
        XCTAssertEqual(URLFormatter.omdbURL(forSearchTerm: "the thing"), URL(string: "http://www.omdbapi.com/?t=the%20thing"))
    }
    
    func testSucessDataFromApi() {
        let mockApiHandler: MyNetworkingProtocol = MockWebServices()
        mockApiHandler.getDataFromApi(searchTerm: "Baby") { (movieList, error) in
            XCTAssertEqual(movieList.first?.title, "baby geniuses")
        }
    }
    
    func getStubData(fileName: String)-> Movie? {
        let currentBundle = Bundle(for: type(of: self))
        if let path = currentBundle.url(forResource: fileName, withExtension: "json") {
            do {
                let dataFromFile = try Data(contentsOf: path)
                let responseFromStub:Movie?  = try JSONDecoder().decode(Movie.self, from: dataFromFile)
                return responseFromStub
            }
            catch {
                return nil
            }
        }
        else {
            return nil
        }
    }
}

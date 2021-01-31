//
//  MovieSearchViewModel.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import Foundation
import UIKit

class MovieSearchViewModel {
    var apiHandler: MyNetworkingProtocol = WebServices()
    var movieList = [Movie]()
    
    func getMovieFromWebService(searchTerm:String, completion: @escaping (Bool) ->()) {
        apiHandler.getDataFromApi(searchTerm: searchTerm) { [self] (movieData,error)  in
            if(error == nil) {
                if movieData.first?.response == "True" {
                    self.movieList = movieData
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return movieList.count
    }
    
    func getMovieIndex(index: Int) -> Movie {
        let movieIndex = movieList[index]
        return movieIndex
    }
    
    func getMovietitle(index: Int) -> String {
        let titleData = getMovieIndex(index: index)
        let title = titleData.title
        return title ?? ""
    }
    
    func getMovieImage(index: Int) -> URL {
        let imageData = getMovieIndex(index: index)
        let image = imageData.poster
        let imageURL = URL(string: image!)
        return imageURL!
    }
    
    func getImdbRatingImageName(index: Int) -> String {
        var rating = 0
        let ratingData = getMovieIndex(index: index)
        if let imdbRating = ratingData.imdbRating {
            let ratingInNumber = Double(imdbRating) ?? 0
            rating = Int(ratingInNumber/10.0 * 5)
        }
        switch rating {
        case 0:
            return "0"
        case 1:
            return "1"
        case 2:
            return "2"
        case 3:
            return "3"
        case 4:
            return "4"
        case 5:
            return "5"
        default:
            print("no image")
            break
        }
        return "0"
    }
}

//
//  MovieSearchViewModel.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import Foundation
import UIKit

class MovieSearchViewModel {
    
    var apiHandler = WebServices()
    var movieList = [Movie]()
    
    
    func getMovieFromWebService(url:String, Completion: @escaping (Bool) ->()) {
        apiHandler.getDataFromApi(apiUrl: url) { [self] (movieData,error)  in
            if(error == nil) {
                if movieData.first?.response == "True" {
                    self.movieList = movieData
                    Completion(true)
                } else {
                    Completion(false)
                }
              } else {
                Completion(false)
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
    
    func getImdbRating(index: Int) -> UIImage {
        let ratingData = getMovieIndex(index: index)
        let imdbRating = ratingData.imdbRating
       // var rate = Int(imdbRating)/10 * 5
        let rate = 4
        var rateImage: UIImage?
        switch rate {
        case 0:
            rateImage = UIImage(named: "0")
            return rateImage!
        case 1:
            rateImage = UIImage(named: "1")
            return rateImage!
        case 2:
            rateImage = UIImage(named: "2")
            return rateImage!
        case 3:
            rateImage = UIImage(named: "3")
            return rateImage!
        case 4:
            rateImage = UIImage(named: "4")
            return rateImage!
        case 5:
            rateImage = UIImage(named: "5")
            return rateImage!
        default:
            print("no image")
            break
        }
        return rateImage!
    }

}

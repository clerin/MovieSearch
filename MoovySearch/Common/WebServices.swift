//
//  WebServices.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import Foundation

protocol MyNetworkingProtocol {
    func getDataFromApi(searchTerm:String, Completion: @escaping ([Movie], Error?) -> ())
}

class MockWebServices: MyNetworkingProtocol {
    var requestShouldSucceed = true
    func getDataFromApi(searchTerm apiUrl:String, Completion: @escaping ([Movie], Error?) -> ()) {
        if requestShouldSucceed {
            let movie = Movie(title: "baby geniuses", imdbRating: "2.7", response: "True")
            Completion([movie], nil)
        } else {
            let error = NSError(domain: "MyDomain", code: 1, userInfo: nil)
            Completion([], error)
        }
    }
}

class WebServices: MyNetworkingProtocol {
    func getDataFromApi(searchTerm:String, Completion: @escaping ([Movie], Error?) -> ()) {
        if let url = URLFormatter.omdbURL(forSearchTerm: searchTerm) {
            let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                DispatchQueue.main.async {
                    if let Data = data {
                        do {
                            let movieData = try Movie(data: Data)
                            Completion([movieData], nil)
                        } catch let error {
                            Completion([], error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

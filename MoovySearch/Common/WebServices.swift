//
//  WebServices.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import Foundation


class WebServices {
    
    func getDataFromApi(apiUrl:String, Completion: @escaping ([Movie],Error?) -> ()) {
        do {
            let url = URL(string: apiUrl)!
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
        } catch let error {
            print(error.localizedDescription)
            Completion([], error)
        }
        
    }
}

//
//  URLFormatter.swift
//  MoovySearch
//
//  Created by Nick Servidio on 1/29/21.
//

import Foundation

class URLFormatter {
    static func omdbURL(forSearchTerm : String) -> URL? {
        let encodedSearchString = forSearchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: (getURL.firstURL.rawValue + encodedSearchString))!
        return url
    }
}

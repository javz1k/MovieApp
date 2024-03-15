//
//  SearchHelper.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 16.03.24.
//

import Foundation
enum searchHelper: String {
    case movieSearch = "search/movie?query=dune&include_adult=false&language=en-US&page="
    
    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}

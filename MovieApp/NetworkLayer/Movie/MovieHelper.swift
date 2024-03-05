//
//  MovieHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 31.01.24.
//

import Foundation
enum MovieHelper: String {
    case popular = "/movie/popular?language=en-US&page="
    case today = "trending/movie/day"
    case week = "trending/movie/week"
    case topRated = "/movie/top_rated"
    
    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}

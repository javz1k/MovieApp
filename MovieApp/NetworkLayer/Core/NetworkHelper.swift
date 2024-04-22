//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    let header = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjEzZTg2ZjljYzliNTRjYTRkZjMyNWZkMjNkZmE4YSIsInN1YiI6IjY1ZGYyNWIyOThmMWYxMDE0YTk4YzUzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kXVZEfQtH5tbTjMud4gHk1IKVdFqX9QIPl80Gku8B5E",
      "content-type": "application/json"
    ]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }   
}

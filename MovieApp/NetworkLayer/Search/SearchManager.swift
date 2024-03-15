//
//  SearchManager.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 16.03.24.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func getPopularMovieList(pageID: Int, complete: @escaping((SearchViewModel?, String?) -> Void)) {
        let url = "\(searchHelper.movieSearch.path)\(pageID)"
        NetworkManager.shared.request(
            type: SearchViewModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}

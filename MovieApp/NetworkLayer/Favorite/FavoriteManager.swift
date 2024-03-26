//
//  FavoriteManager.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 21.03.24.
//

import Foundation

class FavoriteManager {
    static let shared = MovieManager()
    var movieID:Int?
    
    func postFavorite(body: [String: Any], complete: @escaping((PopularMovieModel?, String?) -> Void)) {
//        let accountID = "21040175"
        let url = "https://www.themoviedb.org/movie/\(movieID ?? 0)/toggle-list-item?translate=false"
        NetworkManager.shared.request(
            type: PopularMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            body: body,
            method: .put) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
        
    
}

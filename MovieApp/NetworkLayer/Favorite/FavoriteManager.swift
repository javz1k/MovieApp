//
//  FavoriteManager.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 21.03.24.
//

import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()
//    var movieID:Int = 0
//    var cardDetailControler = CardDetailController()
    let accountID = "21040175"
    
    func postFavorite(body: [String: Any], complete: @escaping((CoreSuccessModel?, String?) -> Void)) {
       
        let url = "https://api.themoviedb.org/3/account/\(accountID)/favorite"
        NetworkManager.shared.request(
            type: CoreSuccessModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            body: body,
            method: .post) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
    
    func getFavoriteList(complete: @escaping((FavoriteGetModel?, String?) -> Void)) {
        let url = "https://api.themoviedb.org/3/account/\(accountID)/favorite/movies"
        NetworkManager.shared.request(
            type: FavoriteGetModel.self,
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

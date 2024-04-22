//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import Foundation

final class FavoriteViewModel {
    var movieID:Int = 0
    var cardDetailControler = CardDetailController()
    var movieList:[MovieCellProtocol] = []
    var favoriteGetModel: FavoriteGetModel?
    var successCallBack:(() -> Void)?
    var errorCallBack:((String) -> Void)?
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
    }
    
    func getMovieCount() -> Int {
        return movieList.count
    }
    
    func favoriteList() {
        if let list = favoriteGetModel?.results, !list.isEmpty {
            movieList = list
            successCallBack?()
        } else {
            getFavoriteListRequest()
        }
    }

    
    
     func postFavoriteRequest(){
        
        let body: [String: Any] = [
            "media_type": "movie",
            "media_id": "",
            "favorite": true
        ]
        
        FavoriteManager.shared.postFavorite(body: body) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                print(errorString)
            }else if let responseData = responseData{
                print(responseData)
            }
        }
        
    }
    
    func getFavoriteListRequest(){
//        showLoading?(true)
        FavoriteManager.shared.getFavoriteList() { [weak self] responseData, errorString in
            guard let self = self else {return}
//            self.showLoading?(false)
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.favoriteGetModel = responseData
                self.movieList = favoriteGetModel?.results ?? []
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
    

}

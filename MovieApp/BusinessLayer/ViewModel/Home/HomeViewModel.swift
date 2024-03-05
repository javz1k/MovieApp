//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import Foundation

final class HomeViewModel{
    private var popularList: PopularMovieModel?
    var successCallBack:(() -> Void)?
    var errorCallBack:((String) -> Void)?
    
    func getMovieForType(type: HeaderType, index: Int){
        if type == .trending{
            if index == 0 {
//                getTodayMovieList()
            }else{
//                getThisWeekMovieList()
            }
        }else{
            if index == 0 {
                getPopularMovieList()
            }else{
//                getTopRatedMovieList()
            }
        }
    }
    
    // MARK: network
    func getPopularMovieList(){
        MovieManager.shared.getPopularMovieList(pageID: 3) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.popularList = responseData
                self.successCallBack?()
                print(responseData)
            }
        }
    }
}

//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import Foundation

final class HomeViewModel{
    private var popularModel: PopularMovieModel?
    private var topRatedModel: TopRatedViewModel?
    private var todayModel: DayViewModel?
    private var weekModel: WeekViewModel?
    var movieList:[MovieCellProtocol] = []
    var successCallBack:(() -> Void)?
    var errorCallBack:((String) -> Void)?
    
    func getMovieForType(type: SegmentType){
        switch type{
        case .Popular :
            getPopularMovieList()
        case .ThisWeek :
            getWeekMovieList()
        case .Today :
            getTodayMovieList()
        case .TopRated :
            getTopRatedMovieList()
        }
    }
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
    }
    
    func getPopularMovieList() {
        if let list = popularModel?.results, !list.isEmpty {
            movieList = list
            successCallBack?()
        } else {
            getPopularMovieListRequest()
        }
    }
    
    func getWeekMovieList() {
        guard let list = weekModel?.results, !list.isEmpty else {
            getWeekMovieListRequest()
            return
        }
        movieList = list
        successCallBack?()
        
    }
    func getTodayMovieList() {
        if let list = todayModel?.results, !list.isEmpty {
            movieList = list
            successCallBack?()
        } else {
            getTodayMovieListRequest()
        }
    }
    func getTopRatedMovieList() {
        if let list = topRatedModel?.results, !list.isEmpty {
            movieList = list
            successCallBack?()
        } else {
            getTopRatedMovieListRequest()
        }
    }
    
    // MARK: Network
    fileprivate func getPopularMovieListRequest(){
        MovieManager.shared.getPopularMovieList(pageID: 3) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
            }else if let responseData = responseData{
                self.popularModel = responseData
                self.movieList = popularModel?.results ?? []
                self.successCallBack?()           
            }
        }
    }
    
    fileprivate func getTopRatedMovieListRequest(){
        MovieManager.shared.getTopRatedMovieList(pageID: 3) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.topRatedModel = responseData
                self.movieList = topRatedModel?.results ?? []
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
    fileprivate func getTodayMovieListRequest(){
        MovieManager.shared.getTodayMovieList(pageID: 3) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.todayModel = responseData
                self.movieList = todayModel?.results ?? []
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
    fileprivate func getWeekMovieListRequest(){
        MovieManager.shared.getWeekMovieList(pageID: 3) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.weekModel = responseData
                self.movieList = weekModel?.results ?? []
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
}

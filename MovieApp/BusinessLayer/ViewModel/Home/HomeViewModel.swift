//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import Foundation

final class HomeViewModel{
    private var popularList: PopularMovieModel?
    private var topRatedList: TopRatedViewModel?
    private var todayList: DayViewModel?
    private var weekList: WeekViewModel?
    
    var successCallBack:(() -> Void)?
    var errorCallBack:((String) -> Void)?
    
    func getMovieForType(type: HeaderType, index: Int){
        if type == .trending{
            if index == 0 {
                getTodayMovieList()
            }else{
                getTopRatedMovieList()
            }
        }else{
            if index == 0 {
                getPopularMovieList()
            }else{
                getWeekMovieList()
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
    
    func getTopRatedMovieList(){
        MovieManager.shared.getTopRatedMovieList() { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.topRatedList = responseData
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
    func getTodayMovieList(){
        MovieManager.shared.getTodayMovieList() { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.todayList = responseData
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
    func getWeekMovieList(){
        MovieManager.shared.getWeekMovieList() { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallBack?(errorString)
                print(errorString)
            }else if let responseData = responseData{
                self.weekList = responseData
                self.successCallBack?()
                print(responseData)
            }
        }
    }
    
}

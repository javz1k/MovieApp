//
//  CommentManager.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

private var popularList: [MovieResult]?
private var topRatedList: [TopRatedResult]?
private var todayList: [DayRes]?
private var weekList: [WeekRes]?

import Foundation

class MovieManager {
    static let shared = MovieManager()
    
    func getPopularMovieList(pageID: Int, complete: @escaping((PopularMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.popular.path)\(pageID)"
        NetworkManager.shared.request(
            type: PopularMovieModel.self,
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
    
    func getTopRatedMovieList(pageID: Int,complete: @escaping((TopRatedViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.topRated.path)\(pageID)"
        NetworkManager.shared.request(
            type: TopRatedViewModel.self,
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
    
    func getTodayMovieList(pageID: Int,complete: @escaping((DayViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.today.path)\(pageID)"
        NetworkManager.shared.request(
            type: DayViewModel.self,
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
    
    func getWeekMovieList(pageID: Int,complete: @escaping((WeekViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.week.path)\(pageID)"
        NetworkManager.shared.request(
            type: WeekViewModel.self,
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

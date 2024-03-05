//
//  CommentManager.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

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
    
    func getTopRatedMovieList(complete: @escaping((TopRatedViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.topRated.path)"
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
    
    func getTodayMovieList(complete: @escaping((DayViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.today.path)"
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
    
    func getWeekMovieList(complete: @escaping((WeekViewModel?, String?) -> Void)) {
        let url = "\(MovieHelper.week.path)"
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

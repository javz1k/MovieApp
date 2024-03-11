//
//  PopularMovieModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 29.02.24.

import Foundation

// MARK: - PopularMovieModel
struct PopularMovieModel: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, MovieCellProtocol {
    var titleString: String {
        originalTitle ?? "title error"
    }
    
    var subTitleString: String {
        releaseDate ?? "release date error"
    }
    
    var iconString: String {
        "https://image.tmdb.org/t/p/w260_and_h390_bestv2/\(posterPath ?? "")"
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

//
//  TopRatedMovieModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 06.03.24.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topRatedViewModel = try? JSONDecoder().decode(TopRatedViewModel.self, from: jsonData)

import Foundation

// MARK: - TopRatedViewModel
struct TopRatedViewModel: Codable {
    let page: Int?
    let results: [TopRatedResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TopRatedResult: Codable, MovieCellProtocol {
    var titleString: String {
        originalTitle ?? "title error"
    }
    
    var subTitleString: String {
        releaseDate ?? "release date error"
    }
    
    var iconString: String {
        ""
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


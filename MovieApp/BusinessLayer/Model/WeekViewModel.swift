//
//  Week.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 06.03.24.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let week = try? JSONDecoder().decode(Week.self, from: jsonData)

import Foundation

// MARK: - Week
struct WeekViewModel: Codable {
    let page: Int?
    let results: [WeekRes]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct WeekRes: Codable, MovieCellProtocol {
    var aboutString: String{
        overview ?? "Overview error"
    }
    
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
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle, overview, posterPath: String?
    let mediaType: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


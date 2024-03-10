//
//  Day.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 05.03.24.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let day = try? JSONDecoder().decode(Day.self, from: jsonData)

import Foundation

// MARK: - Day
struct DayViewModel: Codable {
    let page: Int?
    let results: [DayRes]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct DayRes: Codable, MovieCellProtocol{
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
    let id: Int?
    let title, originalLanguage, originalTitle, overview: String?
    let posterPath: String?
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

//
//  CoreSuccessModel.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 29.03.24.
//

import Foundation

// MARK: - CoreSuccessModel
struct CoreSuccessModel: Codable {
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

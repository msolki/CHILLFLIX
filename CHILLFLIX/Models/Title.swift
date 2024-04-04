//
//  Movie.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import Foundation

/// Represents the response for trending titles.
struct TrendingTitleResponse: Codable {
    let results: [Title]
}

/// Represents a title.
struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let posterPath: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
    /// Coding keys used for encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case id
        case media_type
        case original_name
        case original_title
        case posterPath = "poster_path"
        case overview
        case vote_count
        case release_date
        case vote_average
    }
}

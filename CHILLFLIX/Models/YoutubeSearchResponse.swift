//
//  YoutubeSearchResponse.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import Foundation

/// Represents the response received from a YouTube search.
struct YoutubeSearchResponse: Codable {
    /// An array of video elements returned in the search response.
    let items: [VideoElement]
}

/// Represents a video element in the YouTube search response.
struct VideoElement: Codable {
    /// The ID of the video element.
    let id: IDVideoElement
}

/// Represents the ID of a video element in the YouTube search response.
struct IDVideoElement: Codable {
    /// The kind of the video element.
    let kind: String
    /// The ID of the video.
    let videoId: String
}

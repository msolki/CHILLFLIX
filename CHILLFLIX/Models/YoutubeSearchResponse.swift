//
//  YoutubeSearchResponse.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IDVideoElement
}

struct IDVideoElement: Codable {
    let kind: String
    let videoId: String
}

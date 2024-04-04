//
//  TitlePreviewViewModel.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import Foundation

/// Represents a view model for a title preview.
struct TitlePreviewViewModel {
    /// The title of the preview.
    let title: String
    
    /// The YouTube video associated with the preview.
    let youtubeVideo: VideoElement
    
    /// An overview of the title.
    let titleOverview: String
}

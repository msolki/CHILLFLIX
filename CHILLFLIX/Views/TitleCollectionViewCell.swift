//
//  TitleCollectionViewCell.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import UIKit
import SDWebImage

/// A custom collection view cell used to display a title with an image.
class TitleCollectionViewCell: UICollectionViewCell {
    
    /// A static identifier used to dequeue the cell.
    static let identifier = "TitleCollectionViewCell"
    
    /// The image view used to display the poster image.
    private let posterImageView: UIImageView  =  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    /// Configures the cell with the provided model.
    ///
    /// - Parameter model: The string representing the image URL.
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}

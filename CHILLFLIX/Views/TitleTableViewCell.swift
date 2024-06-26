//
//  TitleTableViewCell.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//
import UIKit
import SDWebImage

/// A custom table view cell for displaying title information.
class TitleTableViewCell: UITableViewCell {
    
    /// The reuse identifier for the cell.
    static let identifier = "TitleTableViewCell"
    
    /// The button for playing the title.
    private let playTitleButton = { () -> UIButton in
        let playButton = UIButton()
        playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    /// The label for displaying the title.
    private let titleLabel = { () -> UILabel in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    /// The image view for displaying the title poster.
    private let titlePosterUIImageView = { () -> UIImageView in
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    /// Applies the necessary constraints for the subviews.
    func applyConstraints() {
        let titlesPosterUIImageViewConstraints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 90),
            titlePosterUIImageView.heightAnchor.constraint(equalToConstant: 140)
        ]
        
        let titleLabelContraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor , constant: 6)
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelContraints)
    }
    
    /// Configures the cell with the given title view model.
    /// - Parameter model: The title view model containing the title information.
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else { return }
        titlePosterUIImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
    }
}

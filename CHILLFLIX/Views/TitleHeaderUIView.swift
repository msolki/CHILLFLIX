//
//  HeroHeaderUIView.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import UIKit

/// A custom UIView subclass that represents a title header view.
class TitleHeaderUIView: UIView {
    
    /// The button used for downloading.
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// The button used for playing.
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// The image view used for displaying the hero image.
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// Adds a gradient layer to the view.
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor,
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    /// Initializes the view with the specified frame.
    /// - Parameter frame: The frame rectangle for the view, measured in points.
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    /// Applies the layout constraints for the subviews.
    func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    /// Configures the view with the specified title view model.
    /// - Parameter model: The title view model used for configuration.
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else { return }
        heroImageView.sd_setImage(with: url)
    }
    
    /// Updates the layout of the subviews.
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    /// - Parameter coder: An unarchiver object.
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

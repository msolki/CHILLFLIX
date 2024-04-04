//
//  SearchResultsViewControllerDelegate.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel)
}

class SearchResultsViewController: UIViewController {
    
    var titles = [Title]()
    
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    let searchResultsCollectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.321 - 10 , height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
        
        view.backgroundColor = .systemRed
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.posterPath ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
            
            let title = titles[indexPath.row]
            
            let titleName = title.original_name ?? title.original_title ?? "N/A"
            
            APICaller.shared.getMovie(with: titleName) { [weak self] result in
                switch result {
                case .success(let videoElement):
                    
                    self?.delegate?.searchResultsViewControllerDidTapItem(TitlePreviewViewModel(title: titleName, youtubeVideo: videoElement, titleOverview: title.overview ?? "N/A"))
                        

                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

//
//  MovieCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class MovieCell: UITableViewCell {
    
    // MARK: - UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Property
    
    var movies = [Movie]()
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        fetchMovies()
    }
    
    // MARK: - Setup
    
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MovieCell")
    }
    
    // MARK: - Func
    
    func fetchMovies() {
        API.searchingTodayMovies(formatToday()) { movies in
            self.movies = movies
            self.collectionView.reloadData()
        }
    }
    
    func formatToday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let date = formatter.string(from: Date())
        let int = Int(date)! - 1
        
        return String(int)
    }
    
}

// MARK: - CollectionView

extension MovieCell: UICollectionViewDelegate,
                     UICollectionViewDataSource,
                     UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        movies.count
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCell",
            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let index = indexPath.item
        cell.updateCell(movie: movies[index], index: index)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
    -> CGSize {
        let width = collectionView.frame.width / 2.3
        
        return CGSize(width: width, height: 320)
    }
    
}

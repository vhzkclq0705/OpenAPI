//
//  TopTapCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class TopTapCell: UITableViewCell {
    
    // MARK: - UI

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Property
    
    let titles = [
        "#박스오피스",
        "#상영예정",
        "#단독",
        "#돌비시네마",
        "#클소",
        "#필소",
    ]
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    // MARK: - Setup
    
    func configureCell() {
        topView.layer.cornerRadius = 12
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TopTapCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TopTapCell")
    }
    
}

// MARK: - CollectionView

extension TopTapCell: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        return titles.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TopTapCell",
            for: indexPath) as? TopTapCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCell(title: titles[indexPath.item], index: indexPath.item)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
    -> CGSize {
        let label = UILabel()
        
        label.text = titles[indexPath.item]
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 15, height: 30)
    }
    
}

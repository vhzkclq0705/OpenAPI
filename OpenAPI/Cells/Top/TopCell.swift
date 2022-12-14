//
//  TopCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/31.
//

import UIKit

class TopCell: UITableViewCell {

    // MARK: - UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Property
    
    let topItems = [
        "O.T",
        "개봉러쉬",
        "돌비시네마",
        "오티북",
        "제휴/할인",
        "카카오페이",
        "포인트몰",
        "신규/휴면"
    ]
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    // MARK: - Setup
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TopCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TopCell")
    }
    
}

// MARK: - CollectionView

extension TopCell: UICollectionViewDelegate,
                   UICollectionViewDataSource,
                   UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        return topItems.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TopCell",
            for: indexPath) as? TopCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let index = indexPath.row
        cell.updateUI(title: topItems[index], index: index)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
    -> CGSize {
        let width = (collectionView.frame.width - 15 * 4) / 5
        let height = collectionView.frame.height - 40
        
        return CGSize(width: width, height: height)
    }
    
}

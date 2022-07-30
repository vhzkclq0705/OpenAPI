//
//  HomeViewController.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/28.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TopCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TopCell")
        
        registerTableViewCells()
        
        midView.layer.cornerRadius = 15
        midView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func registerTableViewCells() {
        let tapNib = UINib(nibName: "TopTapCell", bundle: nil)
        let movieNib = UINib(nibName: "MovieCell", bundle: nil)
        
        tableView.register(tapNib, forCellReuseIdentifier: "TopTapCell")
        tableView.register(movieNib, forCellReuseIdentifier: "MovieCell")
    }
    
}

// MARK: - CollectionView

extension HomeViewController: UICollectionViewDelegate,
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

// MARK: - TableView

extension HomeViewController: UITableViewDelegate,
                              UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TopTapCell") as? TopTapCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MovieCell") as? MovieCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            return cell
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

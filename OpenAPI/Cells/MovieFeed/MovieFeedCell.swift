//
//  MovieFeedCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/31.
//

import UIKit

class MovieFeedCell: UITableViewCell {

    // MARK: - UI
    @IBOutlet weak var movieFeedImageView: UIImageView!
    @IBOutlet weak var minionView: UIView!
    @IBOutlet weak var minionImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    // MARK: - Setup

    func configureCell() {
        [
            movieFeedImageView,
            minionView,
            bottomView,
        ]
            .forEach { $0.layer.cornerRadius = 12 }
        
        minionImageView.layer.cornerRadius = 12
        minionImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        createShadow(minionView)
        createShadow(bottomView)
    }
    
    // MARK: - Func
    
    func createShadow(_ view: UIView) {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 5, height: 10)
        view.layer.cornerRadius = 12
    }
    
}

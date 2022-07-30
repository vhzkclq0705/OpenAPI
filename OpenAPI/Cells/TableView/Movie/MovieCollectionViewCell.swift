//
//  MovieCollectionViewCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    // MARK: - UI
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reservationRateLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    // MARK: - Setup
    
    func configureCell() {
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowRadius = 5
        bottomView.layer.shadowOpacity = 0.2
        bottomView.layer.shadowOffset = CGSize(width: 1, height: 10)
        bottomView.layer.cornerRadius = 12
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        thumbnailImageView.layer.cornerRadius = 12
        thumbnailImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func updateCell(movie: Movie, index: Int) {
        rankLabel.text = "\(index + 1)"
        thumbnailImageView.image = UIImage(named: "\(movie.code)")
        titleLabel.text = movie.name
    }
    
}

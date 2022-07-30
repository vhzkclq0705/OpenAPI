//
//  TobTapCollectionViewCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class TopTapCollectionViewCell: UICollectionViewCell {

    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Setup
    
    func updateCell(title: String, index: Int) {
        if index == 0 {
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
            borderView.isHidden = false
        }
        titleLabel.text = title
    }
    
}

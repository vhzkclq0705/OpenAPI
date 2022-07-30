//
//  TopCollectionViewCell.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {

    // MARK: - UI
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 34
        self.clipsToBounds = true
    }
    
    // MARK: - Setup

    func updateUI(title: String, index: Int) {
        label.text = title
        imageView.image = UIImage(named: "event\(index + 1)")
    }
    
}

//
//  BaseViewController.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let imageView = UIImageView(image: UIImage(named: "topLogo"))
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
        
        let feedButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 30))
            
            var config = UIButton.Configuration.plain()
            config.background.image = UIImage(named: "feed")
            button.configuration = config
            
            return button
        }()
        
        let menuButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            
            var config = UIButton.Configuration.plain()
            config.background.image = UIImage(named: "menu")
            button.configuration = config
            
            return button
        }()
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: menuButton),
            UIBarButtonItem(customView: feedButton)
        ]
    }

}

//
//  HomViewController.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/31.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    // MARK: - Setup
    
    func configureViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let topNib = UINib(nibName: "TopCell", bundle: nil)
        let tapNib = UINib(nibName: "TopTapCell", bundle: nil)
        let movieNib = UINib(nibName: "MovieCell", bundle: nil)
        
        tableView.register(topNib, forCellReuseIdentifier: "TopCell")
        tableView.register(tapNib, forCellReuseIdentifier: "TopTapCell")
        tableView.register(movieNib, forCellReuseIdentifier: "MovieCell")
    }

}

// MARK: - TableView

extension HomeViewController: UITableViewDelegate,
                             UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell") as? TopCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TopTapCell") as? TopTapCell else {
                return UITableViewCell()
            }
            
            return cell
        case 2:
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

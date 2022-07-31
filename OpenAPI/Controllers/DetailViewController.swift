//
//  DetailViewController.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var sectionStackView: UIStackView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var auditsLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var auditsSmallLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var audiAccLabel: UILabel!
    @IBOutlet weak var dateDiffLabel: UILabel!
    @IBOutlet weak var audiCountLabel: UILabel!
    @IBOutlet weak var audiChangeLabel: UILabel!
    
    // MARK: - Property
    
    var data: SendData?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        fetchDetail()
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        self.navigationController?.isNavigationBarHidden = true
        
        thumbnailImageView.image = UIImage(named: data!.code)
        rankLabel.text = "\(data!.rank + 1)위  "
        openLabel.text = data!.openDt
    }
    
    // MARK: - Func

    func fetchDetail() {
        API.searchingDetailMovie(data!.code) { detail in
            self.titleLabel.text = detail.name
            self.auditsLabel.text = detail.audits[0].audit
            self.auditsSmallLabel.text = detail.audits[0].audit
            self.typeLabel.text = self.formatTypes(detail.type)
            self.genreLabel.text = self.formatGenres(detail.genre)
            [self.auditsLabel, self.auditsSmallLabel]
                .forEach { $0.text = self.formatAudits(detail.audits) }
            self.directorLabel.text = self.formatDirectors(detail.directors)
            self.actorsLabel.text = self.formatActors(detail.actors)
        }

    }
    
    func formatTypes(_ types: [ShowType]) -> String {
        let typesStr = types.map { $0.type }
        let stringJoin = typesStr.joined(separator: ", ")
        
        return stringJoin
    }
    
    func formatGenres(_ genres: [Genre]) -> String {
        let genresStr = genres.map { $0.genre }
        let stringJoin = genresStr.joined(separator: ", ")
        
        return stringJoin
    }
    
    func formatDirectors(_ directors: [Director]) -> String {
        let directorsStr = directors.map { $0.director }
        let stringJoin = directorsStr.joined(separator: ", ")
        
        return stringJoin
    }
    
    func formatAudits(_ audits: [Audit]) -> String {
        let auditsStr = audits.map { $0.audit }
        let stringJoin = auditsStr.joined(separator: ", ")
        
        return stringJoin
    }
    
    func formatActors(_ actors: [Actor]) -> String {
        let actorsStr = actors.map { $0.name }
        let stringJoin = actorsStr.joined(separator: ", ")
        
        return stringJoin
    }
}

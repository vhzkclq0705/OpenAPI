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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Setup
    
    func configureViewController() {
        self.navigationController?.isNavigationBarHidden = true
        
        thumbnailImageView.image = UIImage(named: data!.code)
        rankLabel.text = "\(data!.rank + 1)위(12.3%)  "
        openLabel.text = data!.openDt
        audiCountLabel.text = formatAudiCnt(data!.audiCnt)
        formatAudiChange(data!.audiChange)
        audiAccLabel.text = formatAudiAcc(data!.audiAcc)
        dateDiffLabel.text = calculateDateDiff(data!.openDt)
    }
    
    // MARK: - Func

    func fetchDetail() {
        API.searchingDetailMovie(data!.code) { detail in
            self.updateUI(detail)
        }
    }
    
    func updateUI(_ detail: Detail) {
        titleLabel.text = detail.name
        auditsLabel.text = detail.audits[0].audit
        auditsSmallLabel.text = detail.audits[0].audit
        typeLabel.text = formatTypes(detail.type)
        genreLabel.text = formatGenres(detail.genre)
        [auditsLabel, auditsSmallLabel]
            .forEach { $0.text = formatAudits(detail.audits) }
        directorLabel.text = formatDirectors(detail.directors)
        actorsLabel.text = formatActors(detail.actors)
    }
    
    func formatToStringJoin(_ str: [String]) -> String {
        return str.joined(separator: ", ")
    }
    
    func formatTypes(_ types: [ShowType]) -> String {
        return formatToStringJoin(types.map { $0.type })
    }
    
    func formatGenres(_ genres: [Genre]) -> String {
        return formatToStringJoin(genres.map { $0.genre })
    }
    
    func formatDirectors(_ directors: [Director]) -> String {
        return formatToStringJoin(directors.map { $0.director })
    }
    
    func formatAudits(_ audits: [Audit]) -> String {
        return formatToStringJoin(audits.map { $0.audit })
    }
    
    func formatActors(_ actors: [Actor]) -> String {
        return formatToStringJoin(actors.map { $0.name })
    }
    
    func formatAudiCnt(_ audiCnt: String) -> String {
        let number = NSNumber(integerLiteral: Int(audiCnt)!)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: number)!
    }
    
    func formatAudiChange(_ audiChange: String) {
        let num = Float(audiChange)!
        var text = String(format: "%.1f", num) + "%"
        
        if num < 0 {
            text += " ▾"
            audiChangeLabel.textColor = .blue
        }
        else if num > 0 {
            text += " ▴"
            audiChangeLabel.textColor = .red
        } else {
            audiChangeLabel.textColor = .lightGray
        }
        
        audiChangeLabel.text = text
    }
    
    func formatAudiAcc(_ audiAcc: String) -> String {
        let num = Float(audiAcc)! / 10000
        
        return String(format: "%.1f 만", num)
    }
    
    func calculateDateDiff(_ dateStr: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date = formatter.date(from: dateStr)!
        let diff = Calendar.current.dateComponents([.day], from: date, to: Date())
        
        return "개봉 \(diff.day!)일차"
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//
//  MyViewController.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import UIKit

class MyViewController: BaseViewController {

    // MARK: - UI
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var membershipLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
    }
    
    // MARK: - Setup

    func configureNavigationBar() {
        self.navigationItem.title = "나의 메가박스"
    }
    
    func configureViewController() {
        loginLabel.text = "로그인하시면 다양한\n서비스를 이용하실 수 있어요!"
        membershipLabel.attributedText = configureUnderline("멤버십 혜택 보기")
        registerLabel.attributedText = configureUnderline("회원가입 하기")
    }
    
    // MARK: - Func
    
    func configureUnderline(_ text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: text.count))
        
        return attributedString
    }
    
    // MARK: - Action
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        
    }
    
}

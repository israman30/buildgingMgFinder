//
//  InformationVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import SafariServices

class InformationVC: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Monkey®"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var websiteLabel: UILabel = {
        let label = UILabel()
        label.text = "israelmanzo814@gmail.com"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInfoWebsite)))
        return label
    }()
    
    // ========= MARK: - Open information site function block ========
    // ================================================================
    var site = "http://israelmanzo.com"
    @objc func handleInfoWebsite() {
        if site != "http://israelmanzo.com" {
            AlertController.alert(self, title: "🤖", message: "404 Not Found")
        }
        openSafariViewController(for: site)
    }
    
    func openSafariViewController(for url: String) {
        guard let url = URL(string: url) else {
            AlertController.alert(self, title: "🤖", message: "404 Not Found")
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    // ================================================================
    // ================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTransparencyNavBar()
        setInfoView()
    }
}





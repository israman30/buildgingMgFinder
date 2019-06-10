//
//  InformationVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Monkey®"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTransparencyNavBar()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        nameLabel.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 100, paddingBottom: 100, paddingRight: 100)
    }
}

// MARK: - Transparency Navigation Bar Extension
extension UIViewController {
    func setTransparencyNavBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

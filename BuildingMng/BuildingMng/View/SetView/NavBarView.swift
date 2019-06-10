//
//  NavBarView.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/10/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Transparency Navigation Bar Extension
extension UIViewController {
    
    func setTransparencyNavBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
}

extension HomeController {
    // MARK: - Setting the navbar controller
    func setNavBar(){
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        navigationItem.title = "Hob Lux"
        navigationController?.navigationBar.tintColor = .white
        
    }
}

extension DetailsVC {
    // Sub.MARK: - Nav Bar
    func navBarSetUp(){
        let shareIcon = UIImage(named: "share")
        let rightBarButton = UIBarButtonItem(image: shareIcon, style: .plain, target: self, action: #selector(shareButton))
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

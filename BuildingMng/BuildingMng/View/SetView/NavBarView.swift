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

// MARK: - Setting the navbar controller
extension HomeController {
    
    func setNavBar(){
        // Sub.MARK: - Calling nav bar transparency extension method
        setTransparencyNavBar()
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        navigationItem.title = "Hob Lux"
        navigationController?.navigationBar.tintColor = .white
        
    }
}

// MARK: - Set DetailController Nav Bar
extension DetailsVC {
    
    func navBarSetUp(){
        let shareIcon = UIImage(named: "share")
        let rightBarButton = UIBarButtonItem(image: shareIcon, style: .plain, target: self, action: #selector(shareButton))
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

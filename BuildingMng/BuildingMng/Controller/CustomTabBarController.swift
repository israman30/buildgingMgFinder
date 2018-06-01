//
//  CustomTabBarController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.title = "main"
        nav.tabBarItem.image = UIImage(named: "home")
        
        let galleryVC = GalleryVC()
        let secondTabVC = UINavigationController(rootViewController: galleryVC)
        secondTabVC.title = "gallery"
        secondTabVC.tabBarItem.image = UIImage(named: "galleries")
        
        viewControllers = [nav, secondTabVC]
        
        tabBar.isTranslucent = false
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        border.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).cgColor
        tabBar.layer.addSublayer(border)
        tabBar.clipsToBounds = true
    }
}


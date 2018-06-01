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
    }
}


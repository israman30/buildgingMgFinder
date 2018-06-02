//
//  CustomTabBarController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/* ================= INFO ===================
 
 Tab Bar Controller
 - Extended view controller in an array to display on the tab bar
 
 ============================================ */

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Main view controller
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.title = "main"
        nav.tabBarItem.image = UIImage(named: "home")
        
        // Grallery viewcontroller
        let galleryVC = GalleryVC()
        let secondTabVC = UINavigationController(rootViewController: galleryVC)
        secondTabVC.title = "gallery"
        secondTabVC.tabBarItem.image = UIImage(named: "galleries")
        
        // Information view controller
        let info = InformationVC()
        let thirdVC = UINavigationController(rootViewController: info)
        thirdVC.title = "info"
        thirdVC.tabBarItem.image = UIImage(named: "information")
        
        viewControllers = [nav, secondTabVC, thirdVC]
        
        tabBar.isTranslucent = false
        
        // Custom border view on top of tab bar
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        border.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).cgColor
        tabBar.layer.addSublayer(border)
        tabBar.clipsToBounds = true
    }
}


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
        
        tabBar.tintColor = .black
        
        // MARK: - Main view controller
        let vc = HomeController()
        let nav = UINavigationController(rootViewController: vc)
        nav.title = "main"
        nav.tabBarItem.image = UIImage(named: "home")
        
        // MARK: - Grallery viewcontroller
        let secondTabVC = setTabBarController(viewController: GalleryListController(), itemImage: "galleries", title: "gallery")
        
        // MARK: - Information view controller
        let thirdVC = setTabBarController(viewController: InformationVC(), itemImage: "information", title: "info")
        
        viewControllers = [nav, secondTabVC, thirdVC]
        
        tabBar.isTranslucent = false
        
        // MARK: - Custom border view on top of tab bar
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        border.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).cgColor
        tabBar.layer.addSublayer(border)
        tabBar.clipsToBounds = true
    }
}




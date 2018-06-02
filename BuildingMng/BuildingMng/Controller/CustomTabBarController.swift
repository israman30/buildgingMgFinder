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
        
        // MARK: - Main view controller
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.title = "main"
        nav.tabBarItem.image = UIImage(named: "home")
        
        // MARK: - Grallery viewcontroller
        let galleryVC = GalleryVC()
        let secondTabVC = UINavigationController(rootViewController: galleryVC)
        secondTabVC.title = "gallery"
        secondTabVC.tabBarItem.image = UIImage(named: "galleries")
        
        // MARK: - Information view controller
        let info = InformationVC()
        let thirdVC = UINavigationController(rootViewController: info)
        thirdVC.title = "info"
        thirdVC.tabBarItem.image = UIImage(named: "information")
        
        viewControllers = [nav, secondTabVC, thirdVC]
        
        tabBar.isTranslucent = false
        
        // MARK: - Custom border view on top of tab bar
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        border.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).cgColor
        tabBar.layer.addSublayer(border)
        tabBar.clipsToBounds = true
        
        // MARK: - We specify the space between the border and the tab bar items
        guard let items = tabBar.items else {return}
        
        items.forEach { (item) in
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -1, right: 0)
        }
    }
}

extension UITabBarController {
    
    func setNewTabBarController(viewController: UIViewController, itemImage: String, title: String)->UINavigationController{
        let viewController = viewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: itemImage)
        navController.title = title
        
        return navController
    }
}


//
//  ToolBar+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/27/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/*
 MARK: - Set Tab Controller extension method
 - setTabController function can add many tab views as needed
*/
extension UITabBarController {
    
    func setTabBarController(viewController: UIViewController, itemImage: String, title: String)-> UINavigationController {
        let viewController = viewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: itemImage)
        navController.title = title
        
        return navController
    }
}

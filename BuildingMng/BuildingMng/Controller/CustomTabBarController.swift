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
        
        viewControllers = [nav]
    }
}


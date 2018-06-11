//
//  FavoritesViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/10/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 150
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    var favorites: BuildingGallery!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        print(favorites)
    }
}

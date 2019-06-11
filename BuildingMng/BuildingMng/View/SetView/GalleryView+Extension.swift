//
//  GalleryView+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/28/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension GalleryListController {
    // MARK: - Set table view list gallery
    func setTableView(){
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.register(GalleryCell.self, forCellReuseIdentifier: cell)
        tableView.separatorStyle = .none
        
        // Sub.MARK: - Constraints Block
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
    }
}

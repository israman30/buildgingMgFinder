//
//  GalleryVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController {
    
    let cell = "cell"
    
    var galleryInfo: [BuildingGallery]!
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 150
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        galleryInfo = BuildingGallery.sharedGallery.setGalleryPhotos {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        setTableView()
        setDelegatesGalleryViewController()
    }
    
    // MARK: - Set table view list gallery
    fileprivate func setTableView(){
        view.addSubview(tableView)
        
        tableView.register(GalleryCell.self, forCellReuseIdentifier: cell)
        tableView.separatorStyle = .none
        
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
    }
    
}





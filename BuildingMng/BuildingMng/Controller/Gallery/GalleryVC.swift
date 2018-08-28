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
    
}







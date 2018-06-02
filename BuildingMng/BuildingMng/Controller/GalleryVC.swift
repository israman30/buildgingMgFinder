//
//  GalleryVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/*
 
 class Gallery {
 
     var title: String?
     var gallery: [String]?
     init(title: String, gallery: [String]){
        self.title = title
        self.gallery = gallery
    }
 
 }
 
 let gallery1 = Gallery()
 gallery1.name = "Artisan"
 gallery1.gallery = ["p1", "p2", "p3", "p4"]
 
 */

class GalleryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cell = "cell"
    
    var galleryInfo: [Gallery]!
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 40
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        galleryInfo = Gallery.sharedGallery.setGalleryPhotos {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        setTableView()
    }
    
    // MARK: - Set table view list gallery
    func setTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        
        
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    // MARK: - Delegates and Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell)
        cell?.textLabel?.text = galleryInfo[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let galleryDisplay = GalleryDisplay()
        navigationController?.pushViewController(galleryDisplay, animated: true)
    }
    
}

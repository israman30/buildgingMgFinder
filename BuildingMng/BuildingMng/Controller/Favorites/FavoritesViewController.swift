//
//  FavoritesViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/10/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 50
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    var favorites: BuildingGallery!
    var containerFav = [BuildingGallery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setFavoritesView()
        insertNewFavoriteItem()
    }
    
    func insertNewFavoriteItem(){
        containerFav.append(favorites)
        
        let indexPath = IndexPath(row: containerFav.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    fileprivate func setFavoritesView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "favCell")
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (favorites.title?.count)!
        return containerFav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell")
//        cell?.textLabel?.text = favorites.title
        cell?.textLabel?.text = containerFav[indexPath.row].title
        
        return cell!
    }
}

//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let searchBar = UISearchBar()
    
    var filterArray = [BuildingInfo]()
    
    var showResults = false
    
    var buildingInfo: [BuildingInfo]!
    
    let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNavBar()
        setSearchBar()
        buildingInfo = BuildingInfo.shared.setData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Setting the table view
    private func setView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
        
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    //MARK: - Setting the navbar controller
    private func setNavBar(){
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.title = "Hoboken Luxury"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedStringKey.foregroundColor:UIColor.black
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: - Set search bar controller
    func setSearchBar(){
        searchBar.showsCancelButton = false
        searchBar.placeholder = "search for your favorite"
        searchBar.delegate = self
        searchBar.barStyle = .blackTranslucent
        navigationItem.titleView = searchBar
    }

}







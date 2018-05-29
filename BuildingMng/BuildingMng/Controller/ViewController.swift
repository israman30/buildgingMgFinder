//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

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

    // MARK: - DATA SOURCE & DELEGATES
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showResults {
            return filterArray.count
        }
        return buildingInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        let building: BuildingInfo
        if showResults {
            building = filterArray[indexPath.row]
        } else {
            building = buildingInfo[indexPath.row]
        }
        cell.titleLabel.text = building.title
        cell.imagePhotoView.image = UIImage(named: building.imagePhoto!)
        cell.selectionStyle = .none

        return cell
    }
    
    // Sub.MARK: - Passing data to detail VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailDisplayVC = DetailsVC()
        var detail: BuildingInfo = buildingInfo[indexPath.row]
        if showResults {
            detail = filterArray[indexPath.row]
        }
        detailDisplayVC.buildingInfoDetail = detail
        navigationController?.pushViewController(detailDisplayVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let label = UILabel()
        label.text = "Hoboken Luxury"
        let text: String = label.text!
        return text
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    // MARK: - SearchBar Delegates Block Functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterArray = buildingInfo.filter({ (b) -> Bool in
            guard let text = searchBar.text else {return false}
            return b.title!.lowercased().contains(text.lowercased()) && (b.imagePhoto?.lowercased().contains(text.lowercased()))!
        })
        
        showResults = searchText != "" ? true : false
        self.tableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }

}







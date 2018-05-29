//
//  MainViewController+Extensions.swift
//  BuildingMng
//
//  Created by Israel Manzo on 5/28/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/* ================= INFO ===================
 
 Main View Controller Extensions
 - Table View Data Source and Delegates
 - Search Bar Delegate
 
 ============================================ */

// MARK: - TABLE VIEW DATA SOURCE & DELEGATES
extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
        
        /* ===========================================
         if showResults {
         building = filterArray[indexPath.row]
         } else {
         building = buildingInfo[indexPath.row]
         }
         ============================================== */
        
        // MARK: - Using ternary operator to replace the above block of code
        showResults == true ? (building = filterArray[indexPath.row]) : (building = buildingInfo[indexPath.row])
        
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
}

// MARK: - SearchBar Delegates Block Functions
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterArray = buildingInfo.filter({ (b) -> Bool in
            guard let text = searchBar.text else {return false}
            
            return b.title!.lowercased().contains(text.lowercased()) && (b.imagePhoto?.lowercased().contains(text.lowercased()))!
        })
        // Filter find result on the table view
        showResults = searchText != "" ? true : false
        
        self.tableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showResults = true
        searchBar.endEditing(true)
        tableView.reloadData()
    }
}

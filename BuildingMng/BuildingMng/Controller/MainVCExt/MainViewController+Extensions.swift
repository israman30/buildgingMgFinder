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
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return buildingInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        
        cell.titleLabel.text = buildingInfo[indexPath.item].title
        cell.imagePhotoView.image = UIImage(named: buildingInfo[indexPath.item].imagePhoto!)
        cell.layer.cornerRadius = 15
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowOpacity = 0.40
        cell.layer.shadowRadius = 10
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shouldRasterize = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailsVC()
        detailVC.buildingInfoDetail = buildingInfo[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


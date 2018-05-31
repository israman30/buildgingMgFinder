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
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        cell.layer.shadowRadius = 15.0
        cell.layer.shadowOpacity = 0.8
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailsVC()
        detailVC.buildingInfoDetail = buildingInfo[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
//        present(detailVC, animated: true, completion: nil)
    }

    
    
}


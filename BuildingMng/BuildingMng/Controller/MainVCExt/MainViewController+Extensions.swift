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

        
        // MARK: - Using ternary operator to replace the above block of code
        
//        cell.titleLabel.text = buildingInfo[indexPath.item].title
//        cell.imagePhotoView.image = UIImage(named: buildingInfo[indexPath.item].imagePhoto!)
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    

    
    
}


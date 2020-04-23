//
//  MainView+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/27/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Set CollectionViewon MapKit
extension HomeController {
    // Sub.MARK: - Constraints Block
    func setHomeView(){
        
        view.addSubViews(mapView, collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: CellID.homeCell.rawValue)
        
        mapView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

// MARK: - Set CollectionView custom cell
extension UICollectionViewCell {
    
    func customCell() {
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.40
        layer.shadowRadius = 10
        layer.shouldRasterize = false
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}

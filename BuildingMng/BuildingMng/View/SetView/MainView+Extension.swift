//
//  MainView+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/27/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension HomeController {
    // MARK: - Setting the table view
    // Sub.MARK: - Constraints Block
    func setHomeView(){
        
        view.backgroundColor = .white
        
        [mapView, collectionView].forEach { view.addSubview($0) }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: CellID.homeCell.rawValue)
        
        mapView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}


extension UICollectionViewCell {
    
    func customCell(){
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.40
        layer.shadowRadius = 10
        layer.shouldRasterize = false
    }
}

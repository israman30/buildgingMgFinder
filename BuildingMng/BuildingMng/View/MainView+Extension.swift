//
//  MainView+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/27/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension ViewController {
    
    //MARK: - Setting the navbar controller
    func setNavBar(){
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedStringKey.foregroundColor:UIColor.black
        ]
        navigationItem.title = "Hob Lux"
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    // MARK: - Setting the table view
    func setView(){
        view.backgroundColor = .white
        view.addSubview(mapView)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        
        mapView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var buildingInfo: [BuildingInfo]!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNavBar()
        buildingInfo = BuildingInfo.shared.setData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Setting the table view
    private func setView(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
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
    

}







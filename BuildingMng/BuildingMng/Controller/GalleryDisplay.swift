//
//  GalleryDisplay.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryDisplay: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        return cv
    }()
    
    private let displayCell = "displayCell"
    
    var displayGalleries: BuildingGallery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        guard let display = displayGalleries?.gallery,
              let title = displayGalleries?.title else {return}
    }
    
    func setView(){
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: displayCell)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayCell, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 345, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 50)
    }
}











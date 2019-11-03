//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit

class HomeController: UIViewController {
    
    var buildingInfo: [BuildingInfo]!

    var pin: AnnotationPin!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHomeView()
        setNavBar()
        setMapView()
        buildingInfo = BuildingInfo.shared.setData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}



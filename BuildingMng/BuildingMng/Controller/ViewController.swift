//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var buildingInfo: [BuildingInfo]!
    
//    let locationManager = CLLocationManager()
//    var coordinates = CLLocationCoordinate2D()
    var pin: AnnotationPin!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNavBar()
        setMapView()
        buildingInfo = BuildingInfo.shared.setData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Setting the table view
    private func setView(){
        view.backgroundColor = .white
        view.addSubview(mapView)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        
        mapView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    //MARK: - Setting the navbar controller
    private func setNavBar(){
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.titleTextAttributes = [
                        NSAttributedStringKey.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedStringKey.foregroundColor:UIColor.black
                    ]
        navigationItem.title = "Hob Lux"
        navigationController?.navigationBar.tintColor = .white
        
    }
    

}

class AnnotationPin:NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func setMapView(){
        let coordinate = CLLocationCoordinate2D(latitude: 40.7356, longitude: -74.0291)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Hoboken", subtitle: "Path train station", coordinate: coordinate)
        
        mapView.addAnnotation(pin)
    }
    
//    func setMapView(){
//        mapView.delegate = self
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        guard let coords = locationManager.location?.coordinate else {return}
//
//        let region = MKCoordinateRegionMakeWithDistance(coords, 500, 500)
//        mapView.setRegion(region, animated: true)
//
//        coordinates = coords
//
//        let annotation = MKPointAnnotation()
//        annotation.title = "One"
//        annotation.subtitle = "description"
//        annotation.coordinate = coordinates
//        mapView.addAnnotation(annotation)
//    }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
//
//        pin.canShowCallout = true
//
//        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//
//        return pin
//    }
    
    
}







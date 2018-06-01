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
        
        let artisan = AnnotationPin(title: "Artisan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.752310, longitude: -74.035034)) //40.751352, -74.035034
        
        let artisanClinton = AnnotationPin(title: "Artisan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.754650, longitude: -74.030796)) //40.754650, -74.030796
        
        let artisanGrand = AnnotationPin(title: "Artisan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.754474, longitude: -74.031651))//40.754474, -74.031651
        
        let artisanMadison = AnnotationPin(title: "Artisan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.751405, longitude: -74.035204))//40.751405, -74.035204
        
        let theJordan = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.752703, longitude: -74.031684))//40.752703, -74.031684
        
        let theRivington = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.751631, longitude: -74.032527))//40.751631, -74.032527
        
        let observerPark = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.736261, longitude: -74.032839))//40.736261, -74.032839
        
        let theHarllow = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.754042, longitude: -74.029977))//40.754042, -74.029977
        
        let theSovereign = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.753264, longitude: -74.023899))//40.753264, -74.023899
        
        let southIndepence = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.751143, longitude: -74.024499))//40.751143, -74.024499
        
        let theVanguard = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.751655, longitude: -74.025251))//40.751655, -74.025251
        
        let theVine = AnnotationPin(title: "The Jordan", subtitle: "Jefferson", coordinate: CLLocationCoordinate2D(latitude: 40.749530, longitude: -74.037482))//40.749530, -74.037482
        
        [pin,
         artisan,
         artisanClinton,
         artisanGrand,
         artisanMadison,
         theJordan,
         theRivington,
         observerPark,
         theHarllow,
         theSovereign,
         southIndepence,
         theVanguard,
         theVine].forEach { mapView.addAnnotation($0) }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation) {
            return nil
        }

        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "pinH")
        annotationView.image = UIImage(named: "ap")

        let transform = CGAffineTransform(translationX: 0.1, y: 0.1)

        annotationView.transform = transform
        

        return annotationView
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







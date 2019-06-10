//
//  MapKit+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit

/* ================= INFO ===================
 
 Map Kit Controller Extension
 - Data Source and Delegates
 - CLLocation and Annotation
 
 ============================================ */

extension HomeController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func setMapView(){
        let coordinate = CLLocationCoordinate2D(latitude: 40.7356, longitude: -74.0291)
        let region = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 2700, longitudinalMeters: 2700)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Hoboken", subtitle: "Path train station", coordinate: coordinate)
        
        let artisan = AnnotationPin(title: "Artisan", subtitle: "1100 Jefferson St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.752310, longitude: -74.035034)) //40.751352, -74.035034
        
        let artisanClinton = AnnotationPin(title: "Artisan Clinton", subtitle: "1400 Clinton St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.754650, longitude: -74.030796)) //40.754650, -74.030796
        
        let artisanGrand = AnnotationPin(title: "Artisan Grand", subtitle: "1330 Grand St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.754474, longitude: -74.031651))//40.754474, -74.031651
        
        let artisanMadison = AnnotationPin(title: "Artisan Madison", subtitle: "1101 Madison St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.751405, longitude: -74.035204))//40.751405, -74.035204
        
        let theJordan = AnnotationPin(title: "The Jordan", subtitle: "CLINTON ST, HOBOKEN, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.752703, longitude: -74.031684))//40.752703, -74.031684
        
        let theRivington = AnnotationPin(title: "The Rivington", subtitle: "1130 Grand St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.751631, longitude: -74.032527))//40.751631, -74.032527
        
        let observerPark = AnnotationPin(title: "Observer Park", subtitle: "51 Garden St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.736261, longitude: -74.032839))//40.736261, -74.032839
        
        let theHarllow = AnnotationPin(title: "Harllow", subtitle: "1330 Willow Ave, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.754042, longitude: -74.029977))//40.754042, -74.029977
        
        let theSovereign = AnnotationPin(title: "The Sovereign", subtitle: "2 14th St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.753264, longitude: -74.023899))//40.753264, -74.023899
        
        let southIndepence = AnnotationPin(title: "South Indepence", subtitle: "2 12th St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.751143, longitude: -74.024499))//40.751143, -74.024499
        
        let theVanguard = AnnotationPin(title: "The Vanguard", subtitle: "1201 Hudson St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.751655, longitude: -74.025251))//40.751655, -74.025251
        
        let theVine = AnnotationPin(title: "Vine", subtitle: "900 Monroe St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.749530, longitude: -74.037482))//40.749530, -74.037482
        
        let theLex = AnnotationPin(title: "The Lexington", subtitle: "619 Adams St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.745516, longitude: -74.035069))//40.745516, -74.035069
        
        let riverSt = AnnotationPin(title: "River St", subtitle: "333 River St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.739933, longitude: -74.028038))//40.739933, -74.028038
        
        let grandAdams = AnnotationPin(title: "Grand Adams", subtitle: "300 Grand St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.741382, longitude: -74.035820))//40.741382, -74.035820
        
        let ssPark = AnnotationPin(title: "77 Park Ave", subtitle: "77 Park Ave, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.736879, longitude: -74.033470))//40.736879, -74.033470
        
        let maxwell = AnnotationPin(title: "Maxell's", subtitle: "1039 Washington St, Hoboken, NJ 07030", coordinate: CLLocationCoordinate2D(latitude: 40.749239, longitude: -74.023640))//40.749239, -74.023640
        
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
         theVine,
         theLex,
         riverSt,
         grandAdams,
         ssPark,
         maxwell].forEach { mapView.addAnnotation($0) }
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
    
    
}

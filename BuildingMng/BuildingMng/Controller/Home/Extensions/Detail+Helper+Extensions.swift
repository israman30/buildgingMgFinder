//
//  Detail+Helper+Extensions.swift
//  BuildingMng
//
//  Created by Israel Manzo on 5/28/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SafariServices

/* ================= INFO ===================
 
 Deatil View Controller Extension and Helper class
 - MapKit & Core Location
 - Safari Services
 
 ============================================ */

extension DetailsVC {
    
    // MARK: - Share button action
    @objc func shareButton(){
        let activityVC = UIActivityViewController(activityItems: [imageBuildingPhotoDetail, titleLabelBuilding], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = view
        present(activityVC, animated: true, completion: nil)
    }
    
    @objc func contactAction(){
        guard let webSite = buildingInfoDetail?.contact else {return}
        let safariVC = SFSafariViewController(url: URL(string: webSite)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - This block handles the location when use tap the address detail
    @objc func addressAction(){
        let latitude:CLLocationDegrees = 40.756352
        let longitude:CLLocationDegrees = -74.033755
        
        guard let address = buildingInfoDetail?.address else {return}
        let geo = CLGeocoder()
        geo.geocodeAddressString(address) { (placemark, error) in
            guard let placemarker = placemark,
                let location = placemark?.first?.location else {return}
            print(placemarker, location)
        }
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate:regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = address
        mapItem.openInMaps(launchOptions: options)
    }
    
}

class ViewHelper {
    static let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        return iv
    }()
    
    static let titleLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.layer.shadowColor = UIColor.black.cgColor
        lb.layer.shadowRadius = 3.0
        lb.layer.shadowOpacity = 1.5
        lb.numberOfLines = 2
        lb.layer.shadowOffset = CGSize(width: 4, height: 5)
        lb.layer.masksToBounds = false
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        return lb
    }()
    
    static let lineDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
}

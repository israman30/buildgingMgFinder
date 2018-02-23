//
//  DetailsVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/17/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {
    
    let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    let addressLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.text = "building address"
        lb.textColor = .darkGray
        return lb
    }()
    
    let addressBuildingBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(addressAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func addressAction(){
        let latitude:CLLocationDegrees = 40.756352
        let longitude:CLLocationDegrees = -74.033755
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate:regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Place choosen"
        mapItem.openInMaps(launchOptions: options)
    }
    
    var buildingInfoDetail: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = buildingInfoDetail?.imagePhoto else {return}
        imagePhotoView.image = UIImage(named: image)

        guard let title = buildingInfoDetail?.title else {return}
        titleLabelBuilding.text = title
        
        guard let address = buildingInfoDetail?.address else {return}
        addressLabelBuilding.text = address
        print(buildingInfoDetail?.address ?? 0)
        setDetailView()
    }
    
    func setDetailView(){
        view.backgroundColor = .white
        
        [imagePhotoView, titleLabelBuilding, addressBuildingBtn].forEach({view.addSubview($0)})
        addressBuildingBtn.addSubview(addressLabelBuilding)
        
        imagePhotoView.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 300)
        
        titleLabelBuilding.setAnchor(top: imagePhotoView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 310, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
        
        addressBuildingBtn.setAnchor(top: titleLabelBuilding.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addressLabelBuilding.setAnchor(top: addressBuildingBtn.topAnchor, left: addressBuildingBtn.leftAnchor, bottom: addressBuildingBtn.bottomAnchor, right: addressBuildingBtn.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
    }
}





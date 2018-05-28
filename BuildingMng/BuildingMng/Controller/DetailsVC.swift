//
//  DetailsVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/17/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit
import MapKit
import SafariServices
import CoreLocation

class ViewHelper {
    static let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    static let titleLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        return lb
    }()
    
    static let lineDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
}

class DetailsVC: UIViewController {
    
    let imageBuildingPhotoDetail = ViewHelper.imagePhotoView
    let titleLabelBuilding = ViewHelper.titleLabelBuilding
    let lineDividerView = ViewHelper.lineDividerView

    let addressLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.text = "building address"
        lb.textColor = .white
        lb.numberOfLines = 2
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 18)
        return lb
    }()
    
    let addressBuildingBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(addressAction), for: .touchUpInside)
        return btn
    }()
    
    let contactBuildingBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Contact", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = false
        btn.addTarget(self, action: #selector(contactAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func contactAction(){
        guard let webSite = buildingInfoDetail?.contact else {return}
        let safariVC = SFSafariViewController(url: URL(string: webSite)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var buildingInfoDetail: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = buildingInfoDetail?.imagePhoto else {return}
        imageBuildingPhotoDetail.image = UIImage(named: image)

        guard let title = buildingInfoDetail?.title else {return}
        titleLabelBuilding.text = title
        
        guard let address = buildingInfoDetail?.address else {return}
        addressLabelBuilding.text = address
        print(buildingInfoDetail?.address ?? 1)
        setDetailView()
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
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate:regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = address
        mapItem.openInMaps(launchOptions: options)
    }
    
    private func setNavBarDetail(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    private func setDetailView(){
        view.backgroundColor = .white
        
        [imageBuildingPhotoDetail,
         titleLabelBuilding,
         addressBuildingBtn,
         lineDividerView,
         contactBuildingBtn].forEach({view.addSubview($0)})
        
        addressBuildingBtn.addSubview(addressLabelBuilding)
        
        imageBuildingPhotoDetail.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 400)
        
        titleLabelBuilding.setAnchor(top: imageBuildingPhotoDetail.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 450, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 35)
        
        addressBuildingBtn.setAnchor(top: titleLabelBuilding.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addressLabelBuilding.setAnchor(top: addressBuildingBtn.topAnchor, left: addressBuildingBtn.leftAnchor, bottom: addressBuildingBtn.bottomAnchor, right: addressBuildingBtn.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        lineDividerView.setAnchor(top: addressBuildingBtn.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 100, height: 1.5)
        
        contactBuildingBtn.setAnchor(top: lineDividerView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 80, height: 40)
    }
}





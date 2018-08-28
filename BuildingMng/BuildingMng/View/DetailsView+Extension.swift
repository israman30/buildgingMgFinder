//
//  DetailsView+Extension.swift
//  BuildingMng
//
//  Created by Israel Manzo on 8/28/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Detail View Controller Set Main View Extension
extension DetailsVC {
    
    func navBarSetUp(){
        let shareIcon = UIImage(named: "share")
        let rightBarButton = UIBarButtonItem(image: shareIcon, style: .plain, target: self, action: #selector(shareButton))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setDetailView(){
        view.backgroundColor = .white
        
        [imageBuildingPhotoDetail,
         titleLabelBuilding,
         addressBuildingBtn,
         lineDividerView,
         contactBuildingBtn].forEach({view.addSubview($0)})
        
        addressBuildingBtn.addSubview(addressLabelBuilding)
        
        imageBuildingPhotoDetail.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 400)
        
        titleLabelBuilding.setAnchor(top: imageBuildingPhotoDetail.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 460, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 35)
        
        addressBuildingBtn.setAnchor(top: titleLabelBuilding.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addressLabelBuilding.setAnchor(top: addressBuildingBtn.topAnchor, left: addressBuildingBtn.leftAnchor, bottom: addressBuildingBtn.bottomAnchor, right: addressBuildingBtn.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        lineDividerView.setAnchor(top: addressBuildingBtn.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 1.5)
        
        contactBuildingBtn.setAnchor(top: lineDividerView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 80, height: 40)
    }
}


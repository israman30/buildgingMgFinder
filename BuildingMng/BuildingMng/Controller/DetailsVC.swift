//
//  DetailsVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/17/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    let imageBuildingPhotoDetail = ViewHelper.imagePhotoView
    let titleLabelBuilding = ViewHelper.titleLabelBuilding
    let lineDividerView = ViewHelper.lineDividerView

    let addressLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.text = "building address"
        lb.textColor = .white
        lb.layer.shadowColor = UIColor.black.cgColor
        lb.layer.shadowRadius = 3.0
        lb.layer.shadowOpacity = 1.5
        lb.numberOfLines = 2
        lb.layer.shadowOffset = CGSize(width: 4, height: 5)
        lb.layer.masksToBounds = false
        lb.numberOfLines = 2
        lb.font = UIFont.systemFont(ofSize: 16)
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
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowRadius = 3.0
        btn.layer.shadowOpacity = 1.5
        btn.layer.shadowOffset = CGSize(width: 4, height: 5)
        btn.addTarget(self, action: #selector(contactAction), for: .touchUpInside)
        return btn
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var buildingInfoDetail: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let image = buildingInfoDetail?.imagePhoto else {return}
        imageBuildingPhotoDetail.image = UIImage(named: image)

        guard let title = buildingInfoDetail?.title else {return}
        titleLabelBuilding.text = title

        guard let address = buildingInfoDetail?.address else {return}
        addressLabelBuilding.text = address
        print(buildingInfoDetail?.address ?? 1)
        setDetailView()
        
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
        
        titleLabelBuilding.setAnchor(top: imageBuildingPhotoDetail.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 460, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 35)
        
        addressBuildingBtn.setAnchor(top: titleLabelBuilding.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addressLabelBuilding.setAnchor(top: addressBuildingBtn.topAnchor, left: addressBuildingBtn.leftAnchor, bottom: addressBuildingBtn.bottomAnchor, right: addressBuildingBtn.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        lineDividerView.setAnchor(top: addressBuildingBtn.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 1.5)
        
        contactBuildingBtn.setAnchor(top: lineDividerView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 80, height: 40)
    }
}





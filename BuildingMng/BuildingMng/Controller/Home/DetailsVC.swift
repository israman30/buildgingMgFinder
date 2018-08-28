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
    
    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var buildingInfoDetail: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let image = buildingInfoDetail?.imagePhoto,
              let title = buildingInfoDetail?.title,
              let address = buildingInfoDetail?.address else {return}

        imageBuildingPhotoDetail.image = UIImage(named: image)
        titleLabelBuilding.text = title
        addressLabelBuilding.text = address
        
        setDetailView()
        
        navBarSetUp()
    }
    
}






//
//  DetailsVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/17/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let titleLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    var buildingInfoDetail: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = buildingInfoDetail?.imagePhoto else {return}
        imagePhotoView.image = UIImage(named: image)

        guard let title = buildingInfoDetail?.title else {return}
        titleLabelBuilding.text = title
        
        setDetailView()
    }
    
    func setDetailView(){
        view.backgroundColor = .white
        
        [imagePhotoView, titleLabelBuilding].forEach({view.addSubview($0)})
        
        imagePhotoView.setAnchor(top: view.safeTopAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 500)
        
        titleLabelBuilding.setAnchor(top: imagePhotoView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 510, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
    }
}





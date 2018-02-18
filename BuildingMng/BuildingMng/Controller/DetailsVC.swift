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
        iv.backgroundColor = .red
        return iv
    }()
    
    let titleLabelBuilding: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.backgroundColor = .blue
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    var titleLbl: BuildingInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let image = titleLbl?.imagePhoto else {return}
//        imagePhotoView.image = UIImage(named: image)
//
//        guard let title = titleLbl?.title else {return}
//        titleLabelBuilding.text = title
        
        setDetailView()
    }
    
    func setDetailView(){
        view.backgroundColor = .white
        view.addSubview(imagePhotoView)
        view.addSubview(titleLabelBuilding)
        imagePhotoView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 500)
        
        titleLabelBuilding.setAnchor(top: imagePhotoView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 510, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
    }
}





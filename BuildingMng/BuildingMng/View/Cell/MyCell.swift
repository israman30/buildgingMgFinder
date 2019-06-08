//
//  MyCell.swift
//  BuildingMng
//
//  Created by Israel Manzo on 3/13/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class MyCell: Cell {
    
    var buildingImages: BuildingInfo? {
        didSet {
            guard let image = buildingImages?.imagePhoto,
                  let title = buildingImages?.title else {return}
            
            imagePhotoView.image = UIImage(named: image)
            titleLabel.text = title
        }
    }
    
    let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.layer.shadowColor = UIColor.black.cgColor
        lb.layer.shadowRadius = 3.0
        lb.layer.shadowOpacity = 1.5
        lb.numberOfLines = 2
        lb.layer.shadowOffset = CGSize(width: 4, height: 5)
        lb.layer.masksToBounds = false
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    override func setCellView() {
        super.setCellView()
        setView()
    }
    
    // Sub.MARK: - Constraints Block
    func setView(){
        
        [imagePhotoView, titleLabel].forEach { addSubview($0) }
        
        let gradient = CAGradientLayer()
        gradient.frame = imagePhotoView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        imagePhotoView.layer.mask = gradient
        imagePhotoView.layer.addSublayer(gradient)
        
        imagePhotoView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 8, paddingRight: 5)
        
        titleLabel.setAnchor(top: nil, left: imagePhotoView.leftAnchor, bottom: imagePhotoView.bottomAnchor, right: imagePhotoView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 8, paddingRight: 10, width: 150, height: 45)
    }
}

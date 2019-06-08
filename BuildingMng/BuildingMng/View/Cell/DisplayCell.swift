//
//  DisplayCell.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/8/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DisplayCell: Cell {
    
    var gallery: BuildingGallery? {
        didSet {
//            guard let imageGallery = gallery.else { return }
//            imageView.image = imageGallery
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func setCellView() {
        super.setCellView()
        setGalleryDetails()
    }
    
    // Sub.MARK: - Constraints Block
    private func setGalleryDetails(){
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

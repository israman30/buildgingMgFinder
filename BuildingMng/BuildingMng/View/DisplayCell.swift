//
//  DisplayCell.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/8/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DisplayCell: UICollectionViewCell {
    
    var gallery: BuildingGallery? {
        didSet {
            guard let image = gallery?.gallery else { return }
            imageView.image = UIImage(string: image)
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGalleryDetails()
    }
    
    private func setGalleryDetails(){
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

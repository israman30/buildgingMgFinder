//
//  GalleryCell.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/8/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryCell: UITableViewCell {
    
    var titleGallery: BuildingGallery? {
        didSet {
            guard let title = titleGallery?.title,
                  let address = titleGallery?.address else {return}
            
            titleLabel.text = title
            descriptionLabel.text = address
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = . white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 2
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setGalleryTableViewCell()
    }
    
    private func setGalleryTableViewCell(){
        
        addSubview(containerView)
        
        [titleLabel, descriptionLabel].forEach { containerView.addSubview($0) }
        
        containerView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        titleLabel.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 30)
        
        descriptionLabel.setAnchor(top: titleLabel.topAnchor, left: titleLabel.leftAnchor, bottom: containerView.bottomAnchor, right: titleLabel.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

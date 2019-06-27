//
//  InfoView.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/27/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import UIKit

extension InformationVC {
    
    func setInfoView() {
        view.backgroundColor = .white
        view.addSubViews(nameLabel, websiteLabel)
        
        nameLabel.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 100, paddingBottom: 100, paddingRight: 100)
        
        websiteLabel.setAnchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: 100, paddingRight: 50)
    }
}

//
//  Cell.swift
//  BuildingMng
//
//  Created by Israel Manzo on 12/28/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/*
    ================== UICollectionViewCell Base =====================
  - Cell Mockup for protopypes cells
  - The cell can be used as super class for layout, using setCellView()
    ===================================================================
 */

class Cell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellView()
    }
    
    func setCellView() { }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

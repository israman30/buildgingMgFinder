//
//  GalleryDisplay.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryDisplay: UIViewController {
    
    var displayGalleries: BuildingGallery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(displayGalleries ?? 0)
    }
}

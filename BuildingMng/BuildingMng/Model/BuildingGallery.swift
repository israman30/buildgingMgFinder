//
//  BuildingGallery.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

struct Gallery {
    
    var title: String?
    var gallery: [String]?
    
    static let sharedGallery = Gallery()
    
    func setGalleryPhotos(completion: @escaping()->())-> [Gallery]{
        let buildingGallery = [
            Gallery(title: "Artisan", gallery: ["arttisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"])
        ]
        
        return buildingGallery
    }
    
    
}



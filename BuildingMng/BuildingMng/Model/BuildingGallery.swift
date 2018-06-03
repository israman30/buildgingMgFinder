//
//  BuildingGallery.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

struct BuildingGallery {
    
    var title: String?
    var gallery: [String]?
    
    static let sharedGallery = BuildingGallery()
    
    func setGalleryPhotos(completion: @escaping()->())-> [BuildingGallery]{
        let buildingGallery = [
            BuildingGallery(title: "Artisan", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "Artisan", gallery: ["arttisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"])
        ]
        
        return buildingGallery
    }
    
    
}



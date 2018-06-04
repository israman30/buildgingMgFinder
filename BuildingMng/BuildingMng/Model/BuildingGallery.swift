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
            BuildingGallery(title: "Jordan", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "The Rivington", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "Observer Park", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "Harllow", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "The SOVEREIGN", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "The South Independence", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "The Vanguard at the Shipyard", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "VINE", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "COURT YARD", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "The LEXINGTON", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "RIVER STREET", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "GRAND ADAMS", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "77 PARK AVENUE", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"]),
            BuildingGallery(title: "MAXWELL'S", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"])
        ]
        
        return buildingGallery
    }
    
    
}



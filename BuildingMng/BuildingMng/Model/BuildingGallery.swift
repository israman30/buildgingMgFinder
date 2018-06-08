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
    var address: String?
    
    static let sharedGallery = BuildingGallery()
    
    func setGalleryPhotos(completion: @escaping()->())-> [BuildingGallery]{
        let buildingGallery = [
            BuildingGallery(title: "ARTISAN", gallery: ["artisan1", "artisan2", "artisan3", "artisan4", "artisan5", "artisan6"], address: "1100 Jefferson St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "JORDAN", gallery: ["jord1", "jord2", "jord3", "jord4", "jord5", "jord6", "jord7", "jord8", "jord9", "jord10"], address: "1200 CLINTON ST, HOBOKEN, NJ 07030"),
            
            BuildingGallery(title: "THE RIVINGTON", gallery: ["riv1", "riv2", "riv3", "riv5", "riv6", "riv7"], address: "1130 Grand St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "OBSERVER PARK", gallery: ["ob1", "ob2", "ob3", "ob4", "ob5"], address: "51 Garden St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "HARLLOW", gallery: ["hard1", "hard2", "hard3", "hard4", "hard5", "hard6", "hard7", "hard8", "hard9", "hard10"], address: "1330 Willow Ave, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "THE SOVEREIGN", gallery: ["sov1", "sov2", "sov3", "sov4", "sov5"], address: "2 14th St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "THE SOUTH INDEPENCE", gallery: ["south1", "south2", "south3", "south4", "south5", "south6"], address: "2 12th St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "The VANGUARD at the SHIPYARD", gallery: ["van1", "van2", "van3", "van4", "van5"], address: "1201 Hudson St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "VINE", gallery: ["vine1", "vine2", "vine3", "vine4", "vine5", "vine6"], address: "900 Monroe St, Hoboken, NJ 07030"),
            BuildingGallery(title: "COURT YARD", gallery: ["court1", "court2", "court3", "court4", "court5", "court6", "court7"], address: "800 Jefferson St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "The LEXINGTON", gallery: ["lex1", "lex2", "lex3", "lex4", "lex5", "lex6", "lex7"], address: "619 Adams St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "RIVER STREET", gallery: ["river2", "river3", "river4", "river5", "river6"], address: "333 River St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "GRAND ADAMS", gallery: ["grand2", "grand3", "grand4", "grand5"], address: "300 Grand St, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "77 PARK AVENUE", gallery: ["park1", "park2", "park3", "park4", "park5", "park6"], address: "77 Park Ave, Hoboken, NJ 07030"),
            
            BuildingGallery(title: "MAXWELL'S", gallery: ["max1", "max2"], address: "1039 Washington St, Hoboken, NJ 07030")
        ]
        
        return buildingGallery
    }
    
    
}



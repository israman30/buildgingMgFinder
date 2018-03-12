//
//  BuildingInfo.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/23/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

struct BuildingInfo {
    
    var imagePhoto: String?
    var title: String?
    var address: String?
    
    static let shared = BuildingInfo()
    
    func setData()-> [BuildingInfo]{
        let buildingInfo = [
            BuildingInfo(imagePhoto: "artisan", title: "The ARTISAN, Jefferson St.", address: "1100 Jefferson St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "madison", title: "The ARTISAN, Madison St.", address: "1101 Madison St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "grand-1", title: "The ARTISAN, Grand St.", address: "1330 Grand St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "clinton", title: "The ARTISAN, Clinton St.", address: "1400 Clinton St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "jordan", title: "The JORDAN", address: "1200 Clinton St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "rivington", title: "The RIVINGTON", address: "1130 Grand St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "observer", title: "OBSERVER PARK", address: "51 Garden St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "harlow", title: "HARLOW", address: "1330 Willow Ave, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "sovereign", title: "The SOVEREIGN", address: "2 14th St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "south", title: "The South Independence", address: "2 12th St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "van", title: "The Vanguard at the Shipyard", address: "1201 Hudson St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "vine", title: "VINE", address: "900 Monroe St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "court", title: "COURT YARD", address: "800 Jefferson St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "juliana", title: "JULIANA", address: "600 Jackson St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "lex", title: "The LEXINGTON", address: "619 Adams St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "river", title: "RIVER STREET", address: "333 River St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "grand", title: "GRAND ADAMS", address: "300 Grand St, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "77", title: "77 PARK AVENUE", address: "77 Park Ave, Hoboken, NJ 07030"),
            BuildingInfo(imagePhoto: "max", title: "MAXWELL'S", address: "1039 Washington St, Hoboken, NJ 07030")
        ]
        return buildingInfo

    }
    
    
}

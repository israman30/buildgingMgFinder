//
//  ContactWebsiteVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 3/13/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ContactWebSiteVC: UIViewController {
    
    
    let contactView: UIWebView = {
        let wv = UIWebView()
        return wv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
    }
    
    func setView(){
        view.addSubview(contactView)
        
        contactView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

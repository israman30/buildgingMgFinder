//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "hoboken")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(imageView)
        imageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
     
        setView()
        setNavBar()
//        viewEffect()
    }
    
    private func setView(){
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func setNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Lux Appartments"
    }
    
    func viewEffect(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }


}



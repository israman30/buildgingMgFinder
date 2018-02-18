//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func setNavBar(){
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Hoboken Lux Appartments Building"
    }
    
    func viewEffect(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

class MyCell: UITableViewCell {
    
    let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Luxury Apartment Building"
        lb.textColor = .black
        lb.backgroundColor = .blue
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    func setView(){
        addSubview(imagePhotoView)
        addSubview(titleLabel)
        imagePhotoView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 150, height: 150)
        
        titleLabel.setAnchor(top: topAnchor, left: imagePhotoView.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 155, paddingBottom: 0, paddingRight: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





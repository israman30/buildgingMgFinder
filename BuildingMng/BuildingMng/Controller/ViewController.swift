//
//  ViewController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 2/16/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

struct BuildingInfo {
    var imagePhoto: String?
    var title: String?
}

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let buildingInfo = [
        BuildingInfo(imagePhoto: "one", title: "first building"),
        BuildingInfo(imagePhoto: "two", title: "second building"),
        BuildingInfo(imagePhoto: "three", title: "third building"),
        BuildingInfo(imagePhoto: "four", title: "fourth building"),
        BuildingInfo(imagePhoto: "five", title: "fifth building"),
        BuildingInfo(imagePhoto: "six", title: "six building"),
        BuildingInfo(imagePhoto: "seven", title: "seventh building"),
        BuildingInfo(imagePhoto: "eight", title: "eight building"),
        BuildingInfo(imagePhoto: "nine", title: "nine building"),
        BuildingInfo(imagePhoto: "ten", title: "tenth building")
    ]
    
    
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
        navigationController?.navigationBar.barTintColor = .white
        
        navigationItem.title = "Hoboken Lux Appartments"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name:"Marker Felt", size:25.0)!, NSAttributedStringKey.foregroundColor:UIColor.black
        ]
        navigationController?.navigationBar.tintColor = .darkGray
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
        return buildingInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        
        let information = buildingInfo[indexPath.row]
        cell.buildingImages = information
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailDisplayVC = DetailsVC()
        let detail: BuildingInfo = buildingInfo[indexPath.row]
        detailDisplayVC.buildingInfoDetail = detail
        navigationController?.pushViewController(detailDisplayVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}

class MyCell: UITableViewCell {
    
    var buildingImages: BuildingInfo? {
        didSet {
            guard let image = buildingImages?.imagePhoto else {return}
            imagePhotoView.image = UIImage(named: image)
            
            guard let title = buildingImages?.title else {return}
            titleLabel.text = title
        }
    }
    
    let imagePhotoView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.layer.shadowColor = UIColor.black.cgColor
        lb.layer.shadowRadius = 3.0
        lb.layer.shadowOpacity = 1.5
        lb.layer.shadowOffset = CGSize(width: 4, height: 5)
        lb.layer.masksToBounds = false
        
        lb.font = UIFont.boldSystemFont(ofSize: 27)
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    func setView(){
        
        [imagePhotoView, titleLabel].forEach({addSubview($0)})
        
        let gradient = CAGradientLayer()
        gradient.frame = imagePhotoView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        imagePhotoView.layer.mask = gradient
        imagePhotoView.layer.addSublayer(gradient)
        
        imagePhotoView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        
        titleLabel.setAnchor(top: nil, left: imagePhotoView.leftAnchor, bottom: imagePhotoView.bottomAnchor, right: imagePhotoView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 150, height: 35)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





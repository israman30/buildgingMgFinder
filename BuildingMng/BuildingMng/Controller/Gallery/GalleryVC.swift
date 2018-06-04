//
//  GalleryVC.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

/*
 
 class Gallery {
 
     var title: String?
     var gallery: [String]?
     init(title: String, gallery: [String]){
        self.title = title
        self.gallery = gallery
    }
 
 }
 
 let gallery1 = Gallery()
 gallery1.name = "Artisan"
 gallery1.gallery = ["p1", "p2", "p3", "p4"]
 
 */

class GalleryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cell = "cell"
    
    var galleryInfo: [BuildingGallery]!
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 150
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        galleryInfo = BuildingGallery.sharedGallery.setGalleryPhotos {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        setTableView()
    }
    
    // MARK: - Set table view list gallery
    fileprivate func setTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GalleryCell.self, forCellReuseIdentifier: cell)
        tableView.separatorStyle = .none
        
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: - Delegates and Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell) as! GalleryCell
        
        cell.titleLabel.text = galleryInfo[indexPath.row].title
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let galleryDisplay = GalleryDisplay()
        galleryDisplay.displayGalleries = galleryInfo[indexPath.row]
        navigationController?.pushViewController(galleryDisplay, animated: true)
    }
    
}

class GalleryCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = . white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 2
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "hola mundo en espaniol, porque me gusta el espanol"
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "cell")
        setGalleryTableViewCell()
    }
    
    private func setGalleryTableViewCell(){
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        titleLabel.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        descriptionLabel.setAnchor(top: titleLabel.topAnchor, left: titleLabel.leftAnchor, bottom: containerView.bottomAnchor, right: titleLabel.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

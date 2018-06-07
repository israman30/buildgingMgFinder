//
//  DisplayGalleryPhoto.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/7/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DisplayGalleryPhoto: UIViewController {
    
    var photoDisplay: String?
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .yellow
        return iv
    }()
    
    lazy var dismissButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(dimissViewController), for: .touchUpInside)
        return btn
    }()
    
    @objc func dimissViewController(){
        print("work")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        guard let photo = photoDisplay else {return}
        imageView.image = UIImage(named: photo)
//        print(photoDisplay)
        
        view.addSubview(imageView)
        imageView.addSubview(dismissButton)
        imageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 180, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 250)
        
        dismissButton.setAnchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 10, paddingRight: 30, width: 30, height: 20)
    }
}

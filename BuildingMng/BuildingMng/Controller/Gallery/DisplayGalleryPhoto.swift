//
//  DisplayGalleryPhoto.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/7/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class DisplayGalleryPhoto: UIViewController, UIScrollViewDelegate {
    
    var photoDisplay: String?
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .red
        return sv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        return iv
    }()
    
    lazy var dismissButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("close", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(dimissViewController), for: .touchUpInside)
        return btn
    }()
    
    @objc func dimissViewController(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        scrollView.delegate = self
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 1
        scrollView.zoomScale = 1
        
        guard let photo = photoDisplay else {return}
        imageView.image = UIImage(named: photo)
        
        setPhoto()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setPhoto(){
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        imageView.addSubview(dismissButton)
        
        scrollView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 180, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 400)
        
        imageView.setAnchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height)
        
        dismissButton.setAnchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 10, paddingRight: 30, width: 30, height: 20)
    }
}

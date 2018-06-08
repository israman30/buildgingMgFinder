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
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        guard let photo = photoDisplay else {return}
        imageView.image = UIImage(named: photo)
        
        scrollViewSetUpWithDelegates()
        
        setPhoto()
    }
    
    fileprivate func setPhoto(){
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -90, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height)
        
        imageView.setAnchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height)
    }
}

// MARK: - Scroll View Extension SetUp
extension DisplayGalleryPhoto: UIScrollViewDelegate {
    
    // MARK: scroll view detail display photo zoom in - out
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    fileprivate func scrollViewSetUpWithDelegates(){
        scrollView.delegate = self
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 1
        scrollView.zoomScale = 1
    }
}

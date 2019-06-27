//
//  GalleryPagesDisplayController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryPagesDisplayController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .darkGray
        pc.pageIndicatorTintColor = .lightGray
        pc.backgroundColor = .clear
        pc.isUserInteractionEnabled = false
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    var displayGalleries: BuildingGallery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewPagesDisplay()
        navBarForGalleryViewController()
        
        guard let display = (displayGalleries?.gallery?.count) else { return }
        pageControl.numberOfPages = display
    }
    
    // MARK: - Page controller is active when collectionView Paging calls scrollViewWillEndDragging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let xPoint = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(xPoint/view.frame.width)
    }
    
}








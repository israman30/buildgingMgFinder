//
//  GalleryDisplay.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class GalleryDisplay: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    fileprivate let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .darkGray
        pc.pageIndicatorTintColor = .lightGray
        pc.backgroundColor = .clear
        pc.isUserInteractionEnabled = false
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private let displayCell = "displayCell"
    
    var displayGalleries: BuildingGallery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        navBarForGalleryViewController()
        
        pageControl.numberOfPages = (displayGalleries?.gallery?.count)!
    }
    
    // MARK: - Set navbar 
    func navBarForGalleryViewController(){
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Page controller is active when collectionView Paging calls scrollViewWillEndDragging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let xPoint = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(xPoint/view.frame.width)
    }
    
    func setView(){
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        collectionView.register(DisplayCell.self, forCellWithReuseIdentifier: displayCell)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Delegates and Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (displayGalleries?.gallery?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayCell, for: indexPath) as! DisplayCell
        let gallery = UIImage(named: (displayGalleries?.gallery![indexPath.item])!)
        cell.imageView.image = gallery
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let displayPhotoGallery = DisplayGalleryPhoto()
        displayPhotoGallery.photoDisplay = displayGalleries?.gallery![indexPath.item]
        displayPhotoGallery.modalTransitionStyle = .crossDissolve
        displayPhotoGallery.modalPresentationStyle = .overCurrentContext
//        present(displayPhotoGallery, animated: true, completion: nil)
        navigationController?.pushViewController(displayPhotoGallery, animated: true)
//        navigationController?.pushViewController(displayPhotoGallery, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    }
}

class DisplayCell: UICollectionViewCell {
    
    var imagesGallery: BuildingGallery? {
        didSet {
            // TODO
//            guard let gallery = imagesGallery?.gallery else {return}
//            gallery.forEach { (e) in
//                imageView.image = UIImage(named: e)
//            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGalleryDetails()
    }
    
    private func setGalleryDetails(){
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




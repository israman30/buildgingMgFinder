//
//  Gallery+Helper+Extensions.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/8/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Gallery Main View Controller Delegates and Data Source Extension Methods
extension GalleryVC: UITableViewDelegate, UITableViewDataSource  {
    
    func setDelegatesGalleryViewController() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell) as! GalleryCell
        
        let galleryList = galleryInfo[indexPath.row]
        cell.titleGallery = galleryList
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let galleryDisplay = GalleryDisplay()
        galleryDisplay.displayGalleries = galleryInfo[indexPath.row]
        navigationController?.pushViewController(galleryDisplay, animated: true)
    }
    
}

// MARK: - Gallery Display Delegates and Data Source Extension Methods
extension GalleryDisplay: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let gallery = displayGalleries?.gallery?.count {
            return gallery
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: displayCell, for: indexPath) as! DisplayCell
        if let gallery = UIImage(named: (displayGalleries?.gallery![indexPath.item])!) {
            cell.imageView.image = gallery
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let displayPhotoGallery = DisplayGalleryPhoto()
        guard let displayGalleries = displayGalleries?.gallery![indexPath.item] else { return }
        displayPhotoGallery.photoDisplay = displayGalleries
        displayPhotoGallery.modalTransitionStyle = .crossDissolve
        displayPhotoGallery.modalPresentationStyle = .overCurrentContext
        
        navigationController?.pushViewController(displayPhotoGallery, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    }
    
}



//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Aleixo Porpino Filho on 2019-03-14.
//  Copyright © 2019 Porpapps. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        store.fetchImage(for: photo) { (result) -> Void in
            
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath)
                as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
        }
    }
    
}

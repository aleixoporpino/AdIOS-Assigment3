//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by Aleixo Porpino Filho on 2019-03-21.
//  Copyright © 2019 Porpapps. All rights reserved.
//

import Foundation
import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    var photos: [Photo] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell

        return cell
    }
    
}

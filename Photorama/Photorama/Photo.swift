//
//  Photo.swift
//  Photorama
//
//  Created by Aleixo Porpino Filho on 2019-03-14.
//  Copyright © 2019 Porpapps. All rights reserved.
//

import Foundation


class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}

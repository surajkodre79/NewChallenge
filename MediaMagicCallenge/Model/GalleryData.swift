//
//  GalleryData.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation

struct GalleryData : Codable {
    let id : Int?
    let author : String?

    var photoURL: String? {
        if let id = id {
            return GalleryURLs.photoURL+(id.description)
        }
        return nil
    }
}


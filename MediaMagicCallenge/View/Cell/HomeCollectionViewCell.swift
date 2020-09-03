//
//  HomeCollectionViewCell.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    //MARK: Outlet
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var authorTitleLabel: UILabel!
    
    var cellData: GalleryData? {
        didSet {
            guard let data = cellData else { return }
            authorTitleLabel.text = data.author
            let imageUrl = URL(string: data.photoURL ?? "")!
            galleryImageView.loadImageFrom(url: imageUrl)
        }
    }
}


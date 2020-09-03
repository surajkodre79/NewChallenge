//
//  ImageViewExtension.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFrom(url: URL) {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                        self?.image = image
                    }
                }
            }
        }
    }
}


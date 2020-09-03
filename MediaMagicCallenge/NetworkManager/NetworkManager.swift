//
//  NetworkManager.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    public static let sharedInstance = NetworkManager()
    
    private init() {}
    
    func fetchDataFromURL(url: URL?, closure: @escaping ([GalleryData]?,Error?)->()) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { throw JSONError.NoData }
                guard let json = try? JSONDecoder().decode([GalleryData].self, from: data) else { throw JSONError.ConversionFailed }
                closure(json,nil)
            } catch let error as JSONError {
                print(error.rawValue)
                closure(nil,error)
            } catch let error as NSError {
                print("Error: \(error)")
                closure(nil,error)
            }
            }.resume()
    }
}

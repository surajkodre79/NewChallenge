//
//  ViewController.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Properties
    var galleryPhotoArray: [GalleryData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionFlowLayout()
        fetchData()
    }
    
    private func setupCollectionFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let screenSize = UIScreen.main.bounds.size.width
        let itemSize = (screenSize - 105) / 2
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 30)
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 40
        collectionView.collectionViewLayout = layout
    }
    
    private func fetchData() {
        let url = GalleryURLs.baseURL
        showActivityIndicator(dataIsLoading)
        NetworkManager.sharedInstance.fetchDataFromURL(url: url) { [weak self] (galleryData, error) in
            guard let strongSelf = self else { return }
            if error != nil {
                DispatchQueue.main.async {
                    strongSelf.showAlertView(title: alert, actionTitle: oK, message: error?.localizedDescription ?? errorMessage, handler: nil)
                    strongSelf.stopActivityIndicator()
                }
            } else {
                guard let galleryInfo = galleryData else { return }
                DispatchQueue.main.async {
                    strongSelf.stopActivityIndicator()
                    strongSelf.galleryPhotoArray = galleryInfo
                    strongSelf.collectionView.reloadData()
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryPhotoArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HomeCollectionViewCell
        cell.cellData = galleryPhotoArray?[indexPath.row]
        return cell
    }
}

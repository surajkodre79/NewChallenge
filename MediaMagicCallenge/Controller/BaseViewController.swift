//
//  BaseViewController.swift
//  MediaMagicCallenge
//
//  Created by Suraj Kodre on 03/09/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit

import UIKit

class BaseViewController: UIViewController {

    //MARK: property
    let messageFrame = UIView()
    var activityIndicator: UIActivityIndicatorView?
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showActivityIndicator(_ title: String) {
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = .white
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.color = .white
        activityIndicator?.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator?.startAnimating()
       
        effectView.contentView.addSubview(activityIndicator!)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
    
    func stopActivityIndicator() {
        if (activityIndicator != nil) {
            activityIndicator?.stopAnimating()
            strLabel.removeFromSuperview()
            activityIndicator?.removeFromSuperview()
            effectView.removeFromSuperview()
        }
    }
    
    func showAlertView(title: String, actionTitle: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
}

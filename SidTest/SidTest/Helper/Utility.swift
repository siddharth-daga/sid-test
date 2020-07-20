//
//  Utility.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

struct Utility {
    static var sharedInstance = Utility()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    func showLoadingInView(view: UIView) {
        if activityIndicator.isAnimating == false {
            activityIndicator.color = UIColor.lightGray
            activityIndicator.center = view.center
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)
        }
    }
    
    func hideLoadingInView(view: UIView) {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}

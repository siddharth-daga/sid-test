//
//  Utility.swift
//  SidTest
//
//  Created by Siddharth Daga on 20/07/20.
//  Copyright © 2020 Siddharth Daga. All rights reserved.
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

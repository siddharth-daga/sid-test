//
//  BaseViewController.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController: UpdateBaseViewController {
    
    func showLoadingInView() {
        OperationQueue.main.addOperation {
            Utility.sharedInstance.showLoadingInView(view: self.view)
        }
    }
    
    func hideLoadingInView() {
        OperationQueue.main.addOperation {
            Utility.sharedInstance.hideLoadingInView(view: self.view)
        }
    }
}

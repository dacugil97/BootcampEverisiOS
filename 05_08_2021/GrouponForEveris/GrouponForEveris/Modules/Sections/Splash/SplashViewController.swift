//
//  SplashViewController.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 5/8/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
}

//
//  AppCoordinator.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        initialVC = ListaCochesCoordinator.navigation()
        window.rootViewController = initialVC
        window.makeKeyAndVisible()
    }
}

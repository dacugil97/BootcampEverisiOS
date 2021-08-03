//
//  AppCoordinator.swift
//  AppUserDefaultIntro
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        self.initialVC = UserDefaultViewCoordinator.navigation()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
}

//
//  AppCoordinator.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialApp(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    func showInitialApp(window: UIWindow) {
        self.initialVC = HomeCoordinator.view()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
}

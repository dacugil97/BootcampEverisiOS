//
//  AppCoordinator.swift
//  EverisTask
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
        self.initialVC = HomeCoordinator.view()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
}

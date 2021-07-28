//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by David Cuñado Gil on 28/7/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocolo {
    func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocolo {
    
    private var initialVC = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        initialVC = TableMonthCoordinator.navigation()
        window.rootViewController = initialVC
        window.makeKeyAndVisible()
    }
}

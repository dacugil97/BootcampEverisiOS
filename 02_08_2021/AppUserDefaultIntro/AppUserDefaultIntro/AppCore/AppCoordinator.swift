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
        //self.customUI()
        self.initialVC = UserDefaultViewCoordinator.navigation()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
    private func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        navBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.3104598522, green: 0.03145659715, blue: 0.164807111, alpha: 1)
        navBar.barStyle = .default
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
}

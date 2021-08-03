//
//  AppCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        if UserDefaults.standard.object(forKey: Utils.Constantes.nombre) == nil {
            self.initialVC = LoginCoordinator.view()
        } else {
            self.initialVC = HomeCoordinator.view()
        }
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
}

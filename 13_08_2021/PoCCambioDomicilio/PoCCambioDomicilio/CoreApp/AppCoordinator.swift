//
//  AppCoordinator.swift
//  PoCCambioDomicilio
//
//  Created by David Cuñado Gil on 13/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    func initialViewController(window: UIWindow) {
        self.initialVC = SplashCoordinator().build()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
        
    }
        
    static let defaultHTTPHeader: [String: String] = {
        return ["Content-Type":"application/json"]
    }()
    
}

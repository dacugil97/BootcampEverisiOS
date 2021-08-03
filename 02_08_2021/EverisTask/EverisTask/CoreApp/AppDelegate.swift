//
//  AppDelegate.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variables
    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appCoordinator.showInitialVC(window: windowDes)
        }
        
        return true
    }

}


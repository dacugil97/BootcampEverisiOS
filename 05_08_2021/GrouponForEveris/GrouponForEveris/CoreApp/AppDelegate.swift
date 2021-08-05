//
//  AppDelegate.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 5/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let windowDes = window {
            appCoordinator.showInitialApp(window: windowDes)
        }
        
        return true
    }
}


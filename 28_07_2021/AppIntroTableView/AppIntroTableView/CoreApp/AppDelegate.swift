//
//  AppDelegate.swift
//  AppIntroTableView
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocolo = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let windowDes = window {
            appCoordinator.showInitialVC(window: windowDes)
        }
        
        return true
    }


}


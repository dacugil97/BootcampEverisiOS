//
//  HomeCoordinator.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    static func view() -> HomeViewController {
        let tbVC = HomeViewController()
        
        let listaVC = ListaContactosCoordinator.navigation()
        let customButton = UITabBarItem(title: "Mis contactos", image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        listaVC.tabBarItem = customButton
        
        tbVC.viewControllers = [listaVC]
        
        return tbVC
    }
    
}

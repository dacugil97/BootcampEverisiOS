//
//  HomeCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    static func view() -> HomeViewController {
        let tbVC = HomeViewController()
        
        let userVC = UserCoordinator.navigation()
        let userButton = UITabBarItem(title: "Tu perfil", image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        userVC.tabBarItem = userButton
        
        let contactsVC = ContactListCoordinator.navigation()
        let contactButton = UITabBarItem(title: "Contactos", image: UIImage(named: "TRIFECA_2M"), selectedImage: UIImage(named: "TRIFECA_2M"))
        contactsVC.tabBarItem = contactButton
        
        tbVC.viewControllers = [contactsVC, userVC]
        
        return tbVC
    }
    
}

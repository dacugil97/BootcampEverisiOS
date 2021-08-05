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
        let customButton = UITabBarItem(title: "Mis contactos", image: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TRIFECA_0M"))
        listaVC.tabBarItem = customButton
        
        let newTaskVC = NewTaskCoordinator.navigation()
        let customButton2 = UITabBarItem(title: "Tareas", image: UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TRIFECA_1M"))
        newTaskVC.tabBarItem = customButton2
        
        let listaTareaVC = ListaTareasViewController()
        let customButton3 = UITabBarItem(title: "Lista de Tareas",
                                         image: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal),
                                         selectedImage: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal))
        listaTareaVC.tabBarItem = customButton3
        
        tbVC.viewControllers = [listaVC, newTaskVC, listaTareaVC]
        
        return tbVC
    }
    
}

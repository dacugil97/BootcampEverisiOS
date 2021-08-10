//
//  HomeTabBarCoordinator.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 9/8/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    static func HomeTabBar(dto: HomeTabBarCoordinatorDTO? = nil) -> HomeTabBarViewController {
        
        let homeTabVC = HomeTabBarViewController()
        
        let listaVC = ListaGrouponCoordinator().navigation(dto: ListaGrouponCoordinatorDTO(modelData: dto?.modelData))
        
        let listaButton: UITabBarItem = UITabBarItem(title: "Groupones", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        listaVC.tabBarItem = listaButton
        
        homeTabVC.viewControllers = [listaVC]
        
        return homeTabVC
    }
}

struct HomeTabBarCoordinatorDTO {
    var modelData: [DataViewModel]?
}

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
        
        let grouponVC = ListaGrouponCoordinator().navigation(dto: ListaGrouponCoordinatorDTO(modelData: dto?.modelData))
        let grouponButton: UITabBarItem = UITabBarItem(title: "Groupones", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        grouponVC.tabBarItem = grouponButton
        
        let legalVC = LegalesCoordinator().navigation()
        let legalButton: UITabBarItem = UITabBarItem(title: "Legales", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        legalVC.tabBarItem = legalButton
        
        homeTabVC.viewControllers = [grouponVC, legalVC]
        
        return homeTabVC
    }
}

struct HomeTabBarCoordinatorDTO {
    var modelData: [DataViewModel]?
}

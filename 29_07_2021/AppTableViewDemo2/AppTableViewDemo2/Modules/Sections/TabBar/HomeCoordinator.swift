//
//  HomeCoordinator.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

final class HomeCoordinator {
    static func view() -> HomeViewController {
        let vc = HomeViewController()
        
        let vcCoches = ListaCochesCoordinator.navigation()
        vcCoches.title = "Lista de coches"
        let vcPerfil = PerfilCoordinator.navigation()
        vcPerfil.title = "Perfil"
        
        vc.viewControllers = [vcCoches, vcPerfil]
        
        return vc
    }
}

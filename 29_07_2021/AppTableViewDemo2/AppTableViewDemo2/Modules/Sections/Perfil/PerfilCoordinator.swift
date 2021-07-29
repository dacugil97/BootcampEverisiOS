//
//  PerfilCoordinator.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

final class PerfilCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> PerfilViewController {
        let vc = PerfilViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: PerfilViewController) -> PerfilPresenterProtocol {
        let presenter = PerfilPresenter(vc: vc)
        return presenter
    }
}

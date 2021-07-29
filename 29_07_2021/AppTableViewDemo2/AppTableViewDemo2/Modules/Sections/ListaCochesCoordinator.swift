//
//  ListaCochesCoordinator.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

final class ListaCochesCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ListaCochesViewController {
        let vc = ListaCochesViewController()
        vc.presenter = presenter()
        return vc
    }
    
    static func presenter() -> ListaCochesPresenterProtocol {
        let presenter = ListaCochesPresenter()
        return presenter
    }
}

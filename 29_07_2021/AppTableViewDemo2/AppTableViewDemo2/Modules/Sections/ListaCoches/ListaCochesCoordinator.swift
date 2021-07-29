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
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ListaCochesViewController) -> ListaCochesPresenterProtocol {
        let presenter = ListaCochesPresenter(vc: vc)
        return presenter
    }
}

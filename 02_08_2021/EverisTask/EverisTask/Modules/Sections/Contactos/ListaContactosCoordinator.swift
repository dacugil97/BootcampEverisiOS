//
//  ListaContactosCoordinator.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation
import UIKit

final class ListaContactosCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ListaContactosViewController {
        let vc = ListaContactosViewController()
        vc.presenter = self.presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ListaContactosViewController) -> ListaContactosPresenterProtocol {
        let presenter = ListaContactosPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: ListaContactosViewController) -> ListaContactosRouterProtocol {
        let router = ListaContactosRouter(vc: vc)
        return router
    }
}

//
//  UserCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class UserCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> UserViewController {
        let vc = UserViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: UserViewController) -> UserPresenterProtocol {
        let presenter = UserPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: UserViewController) -> UserRouterProtocol {
        let router = UserRouter(vc: vc)
        return router
    }
}


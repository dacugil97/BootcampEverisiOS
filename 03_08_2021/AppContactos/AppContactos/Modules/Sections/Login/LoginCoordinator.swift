//
//  LoginCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class LoginCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> LoginViewController {
        let vc = LoginViewController()
        vc.presenter = self.presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: LoginViewController) -> LoginPresenterProtocol {
        let presenter = LoginPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: LoginViewController) -> LoginRouterProtocol {
        let router = LoginRouter(vc: vc)
        return router
    }
    
}

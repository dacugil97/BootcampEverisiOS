//
//  LoginRouter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation

protocol LoginRouterProtocol {
    func loginSuccess()
}

final class LoginRouter {
    
    let vc: LoginViewController?
    
    init(vc: LoginViewController) {
        self.vc = vc
    }
}

extension LoginRouter: LoginRouterProtocol {
    func loginSuccess() {
        DispatchQueue.main.async {

            let vc = HomeCoordinator.view()
            vc.modalPresentationStyle = .fullScreen
            self.vc?.present(vc, animated: true, completion: nil)
        }
    }
    
}

//
//  UserRouter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

protocol UserRouterProtocol {
    func manageLogout()
    func editProfileImage()
}

final class UserRouter {
    
    let vc: UserViewController?
    
    init(vc: UserViewController) {
        self.vc = vc
    }
}

extension UserRouter: UserRouterProtocol {
    func manageLogout() {
        DispatchQueue.main.async {
            let vc = LoginCoordinator.view()
            vc.modalPresentationStyle = .fullScreen
            self.vc?.present(vc, animated: true)
        }
    }
    
    func editProfileImage() {
        DispatchQueue.main.async {
            let vc = ImageDetailCoordinator.view()
            self.vc?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

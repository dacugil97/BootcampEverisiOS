//
//  ContactListCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class ContactListCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ContactListViewController {
        let vc = ContactListViewController()
        vc.presenter = self.presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ContactListViewController) -> ContactListPresenterProtocol {
        let presenter = ContactListPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: ContactListViewController) -> ContactListRouterProtocol {
        let router = ContactListRouter(vc: vc)
        return router
    }
}

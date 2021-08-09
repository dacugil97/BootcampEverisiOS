//
//  ContactListCoordinator.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import Foundation

final class ContactListCoordinator {
    
    static func navigation() -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view() -> ContactListViewController {
        
        let vc = ContactListViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ContactListViewController) -> ContactListPresenterProtocol {
        let presenter = ContactListPresenter(vc: vc)
        presenter.router = router(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        return presenter
    }
    
    static func interactor(presenter: ContactListPresenter) -> ContactListInteractorProtocol {
        
        let interactor = ContactListInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: ContactListViewController) -> ContactListRouterProtocol {
        
        let router = ContactListRouter(vc: vc)
        router.presenter = ContactListPresenter(vc: vc)
        return router
    }
}

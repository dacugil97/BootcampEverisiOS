//
//  ContactListRouter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation

protocol ContactListRouterProtocol {
    func showDetail(dto: ArrayContact)
}

final class ContactListRouter {
    
    var vc: ContactListViewController?
    
    init(vc: ContactListViewController) {
        self.vc = vc
    }
}

extension ContactListRouter: ContactListRouterProtocol {
    
    func showDetail(dto: ArrayContact) {
        DispatchQueue.main.async {
            let vc = ContactDetailCoordinator.view(dto: ContactDetailCoordinatorDTO(modelData: dto))
            
            self.vc?.present(vc, animated: true, completion: nil)
        }
    }
}

//
//  ContactListRouter.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import Foundation

protocol ContactListRouterProtocol {
    func showDetail(dto: ArrayContact)
}

final class ContactListRouter: BaseRouter<ContactListPresenterProtocol>, ContactListRouterProtocol {
    func showDetail(dto: ArrayContact) {
        DispatchQueue.main.async {
            self.vc?.navigationController?.pushViewController(ContactDetailCoordinator.view(dto: ContactDetailCoordinatorDTO(modelData: dto)), animated: true)
        }
    }
}

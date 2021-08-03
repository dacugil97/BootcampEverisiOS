//
//  ContactListPresenter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

protocol ContactListPresenterProtocol {
    func viewDidLoadInPresent()
    func numberOfRowsInSection() -> Int
    func informationCell(indexPath: Int) -> ArrayContact
    func showDetailContact(dto: ArrayContact)
}

final class ContactListPresenter {
    
    // MARK: - Variables
    var contactos: [ArrayContact] = []
    let vc: ContactListViewController?
    var router: ContactListRouterProtocol?
    
    init(vc: ContactListViewController) {
        self.vc = vc
    }
    
}

extension ContactListPresenter: ContactListPresenterProtocol {
    func viewDidLoadInPresent() {
        if let model = ContactsModel.stubContacts {
            self.contactos = model
            self.vc?.reloadDataInView()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return self.contactos.count
    }
    
    func informationCell(indexPath: Int) -> ArrayContact {
        return self.contactos[indexPath]
    }
    
    func showDetailContact(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
}

//
//  ListaContactosPresenter.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation

protocol ListaContactosPresenterProtocol {
    func viewDidLoadInPresent()
    func numberOfRowsInSection() -> Int
    func informationCell(indexPath: Int) -> ArrayContact
    func showDetailContact(dto: ArrayContact)
}

final class ListaContactosPresenter {
    
    // MARK: - Variables
    var arrayContacts: [ArrayContact] = []
    let vc: ListaContactosViewController?
    var router: ListaContactosRouterProtocol?
    
    init(vc: ListaContactosViewController) {
        self.vc = vc
    }
}

extension ListaContactosPresenter: ListaContactosPresenterProtocol {
    func viewDidLoadInPresent() {
        if let model = ContactsModel.stubContacts {
            self.arrayContacts = model
            self.vc?.reloadDataInView()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return self.arrayContacts.count
    }
    
    func informationCell(indexPath: Int) -> ArrayContact {
        return self.arrayContacts[indexPath]
    }
    
    func showDetailContact(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
}

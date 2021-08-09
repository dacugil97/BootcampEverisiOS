//
//  ContactListPresenter.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import Foundation

protocol ContactListPresenterProtocol {
    func setData()
    func numberOfContacts() -> Int
    func getContactInfo(index: Int) -> ArrayContact
    func showContactInfo(contact: ArrayContact)
}

final class ContactListPresenter: BasePresenter<ContactListViewControllerProtocol, ContactListRouterProtocol, ContactListInteractorProtocol> {
    
    // MARK: - Variables
    var contacts: [ArrayContact] = []
    
}

extension ContactListPresenter: ContactListPresenterProtocol {
    
    func setData() {
        if let model = self.interactor?.fetchData() {
            self.contacts = model
            self.vc?.reloadTableData()
        }
    }
    
    func numberOfContacts() -> Int {
        return contacts.count
    }
    
    func getContactInfo(index: Int) -> ArrayContact {
        return self.contacts[index]
    }
    
    func showContactInfo(contact: ArrayContact) {
        self.router?.showDetail(dto: contact)
    }
    
}

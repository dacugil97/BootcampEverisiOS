//
//  ContactListInteractor.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import Foundation

protocol ContactListInteractorProtocol {
    func fetchData() -> [ArrayContact]
}

final class ContactListInteractor: BaseInteractor<ContactListPresenterProtocol>, ContactListInteractorProtocol {
    
    func fetchData() -> [ArrayContact] {
        if let model = ContactsModel.stubContacts {
            return model
        } else {
            return []
        }
    }
    
}

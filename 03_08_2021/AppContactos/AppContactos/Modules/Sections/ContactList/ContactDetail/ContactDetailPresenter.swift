//
//  ContactDetailPresenter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation

protocol ContactDetailPresenterProtocol {
    func informationData() -> ArrayContact?
}

final class ContactDetailPresenter {
    
    var modelData: ArrayContact?
    let vc: ContactDetailViewController?
    init(vc: ContactDetailViewController) {
        self.vc = vc
    }
}

extension ContactDetailPresenter: ContactDetailPresenterProtocol {
    
    func informationData() -> ArrayContact? {
        return modelData
    }
    
    
}

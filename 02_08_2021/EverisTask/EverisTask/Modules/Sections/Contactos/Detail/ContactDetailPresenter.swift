//
//  ContactDetailPresenter.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation

protocol ContactDetailPresenterProtocol {
    func getDataModel()
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
    func getDataModel() {
        self.vc?.reloadDataModel()
    }
    
    func informationData() -> ArrayContact? {
        return modelData
    }
    
    
}

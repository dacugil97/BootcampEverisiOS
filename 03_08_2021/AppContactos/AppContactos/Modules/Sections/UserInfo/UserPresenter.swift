//
//  UserPresenter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation

protocol UserPresenterProtocol {
    
    func logout()
    func editImage()
}

final class UserPresenter {
    
    // MARK: - Variables
    let vc: UserViewController?
    var router: UserRouterProtocol?
    
    init(vc: UserViewController) {
        self.vc = vc
    }
    
    private func deleteUserInfo() {
        Utils.UserDefaultDDBB.prefs.removeObject(forKey: Utils.Constantes.nombre)
        Utils.UserDefaultDDBB.prefs.removeObject(forKey: Utils.Constantes.apellido)
        Utils.UserDefaultDDBB.prefs.removeObject(forKey: Utils.Constantes.trabajo)
        Utils.UserDefaultDDBB.prefs.removeObject(forKey: Utils.Constantes.telefono)
    }
}

extension UserPresenter: UserPresenterProtocol {
    
    func logout() {
        self.deleteUserInfo()
        self.router?.manageLogout()
    }
    
    func editImage() {
        self.router?.editProfileImage()
    }
}

//
//  LoginPresenter.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation

protocol LoginPresenterProtocol {
    func manageSuccessfulLogin()
    func setUserInfo(nombre: String?, apellido: String?, trabajo: String?, telefono: String?, imagen: Data?)
}

final class LoginPresenter {
    
    // MARK: - Variables
    let vc: LoginViewController?
    var router: LoginRouterProtocol?
    
    init(vc: LoginViewController) {
        self.vc = vc
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func manageSuccessfulLogin() {
        self.router?.loginSuccess()
    }
    
    func setUserInfo(nombre: String?, apellido: String?, trabajo: String?, telefono: String?, imagen: Data?) {
        
        Utils.UserDefaultDDBB.prefs.set(nombre, forKey: Utils.Constantes.nombre)
        Utils.UserDefaultDDBB.prefs.set(apellido, forKey: Utils.Constantes.apellido)
        Utils.UserDefaultDDBB.prefs.set(trabajo, forKey: Utils.Constantes.trabajo)
        Utils.UserDefaultDDBB.prefs.set(telefono, forKey: Utils.Constantes.telefono)
        Utils.UserDefaultDDBB.prefs.set(imagen, forKey: Utils.Constantes.imagenPerfil)
    }
}

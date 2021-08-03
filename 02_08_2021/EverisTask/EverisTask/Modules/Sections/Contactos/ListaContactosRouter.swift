//
//  ListaContactosRouter.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation

protocol ListaContactosRouterProtocol {
    func showDetail(dto: ArrayContact)
}

final class ListaContactosRouter {
    
    let vc: ListaContactosViewController?
    
    init(vc: ListaContactosViewController) {
        self.vc = vc
    }
}

extension ListaContactosRouter: ListaContactosRouterProtocol {
    func showDetail(dto: ArrayContact) {
        DispatchQueue.main.async {
            self.vc?.navigationController?.pushViewController(ContactDetailCoordinator.view(dto: ContactDetailCoordinatorDTO(modelData: dto)), animated: true)
        }
    }
    
}

//
//  ContactDetailCoordinator.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class ContactDetailCoordinator {
    
    static func view(dto: ContactDetailCoordinatorDTO? = nil) -> ContactDetailViewController {
        let vc = ContactDetailViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    static func presenter(vc: ContactDetailViewController, dto: ContactDetailCoordinatorDTO? = nil) -> ContactDetailPresenterProtocol {
        let presenter = ContactDetailPresenter(vc: vc)
        presenter.modelData = dto?.modelData
        return presenter
    }
}

struct ContactDetailCoordinatorDTO {
    var modelData: ArrayContact?
}

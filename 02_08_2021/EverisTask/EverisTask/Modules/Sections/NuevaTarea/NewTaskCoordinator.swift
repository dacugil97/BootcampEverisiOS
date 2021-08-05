//
//  NewTaskCoordinator.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import Foundation
import UIKit

final class NewTaskCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> NewTaskViewController {
        let vc = NewTaskViewController()
        //vc.presenter = self.presenter(vc: vc)
        return vc
    }
    /*
    static func presenter(vc: NewTaskViewController) -> NewTaskPresenterProtocol {
        let presenter = NewTaskPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: NewTaskViewController) -> NewTaskRouterProtocol {
        let router = NewTaskRouter(vc: vc)
        return router
    }
 */
}

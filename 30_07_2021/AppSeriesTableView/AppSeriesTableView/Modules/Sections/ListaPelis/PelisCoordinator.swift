//
//  PelisCoordinator.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

final class PelisCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> PelisViewController {
        let vc = PelisViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: PelisViewController) -> PelisPresenterProtocol {
        let presenter = PelisPresenter(vc: vc)
        return presenter
    }
}

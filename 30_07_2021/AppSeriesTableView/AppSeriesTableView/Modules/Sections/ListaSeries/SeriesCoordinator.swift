//
//  SeriesCoordinator.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

final class SeriesCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> SeriesViewController {
        let vc = SeriesViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SeriesViewController) -> SeriesPresenterProtocol {
        let presenter = SeriesPresenter(vc: vc)
        return presenter
    }
}

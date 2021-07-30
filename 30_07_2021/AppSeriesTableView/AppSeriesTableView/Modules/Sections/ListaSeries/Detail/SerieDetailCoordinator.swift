//
//  SerieDetailCoordinator.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

final class SerieDetailCoordinator {
    
    // Variables
    var serie: SeriesModel?
    
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view(serie: SeriesModel? = nil) -> SerieDetailViewController {
        let vc = SerieDetailViewController()
        vc.serie = serie ?? nil
        return vc
    }
}

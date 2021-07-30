//
//  HomeViewCoordinator.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

final class HomeViewCoordinator {
    static func view() -> HomeViewController {
        let vc = HomeViewController()
        
        let vcSeries = SeriesCoordinator.navigation()
        vcSeries.title = "Series"
        
        let vcPelis = PelisCoordinator.navigation()
        vcPelis.title = "Películas"
        
        vc.viewControllers = [vcSeries, vcPelis]
        
        return vc
    }
}

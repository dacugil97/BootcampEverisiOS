//
//  TableDayCoordinator.swift
//  AppTableViewChallenge
//
//  Created by David Cuñado Gil on 28/7/21.
//

import Foundation
import UIKit

final class TableDayCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> TableDayViewController {
        TableDayViewController()
    }
}

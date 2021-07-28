//
//  DetailCoordinator.swift
//  AppTableViewChallenge
//
//  Created by David Cuñado Gil on 28/7/21.
//

import Foundation
import UIKit

final class DetailCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view(dto: DetailCoordinatorDTO? = nil) -> DetailViewController {
        let vc = DetailViewController()
        vc.nombreDia = dto?.nombreDia ?? ""
        return vc
    }
}

struct DetailCoordinatorDTO {
    var nombreDia: String?
}

//
//  UserDefaultViewCoordinator.swift
//  AppUserDefaultIntro
//
//  Created by David Cuñado Gil on 2/8/21.
//

import Foundation
import UIKit

final class UserDefaultViewCoordinator {
    
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> UserDefaultViewController {
        UserDefaultViewController()
    }
    
}

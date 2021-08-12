//
//  GenericWebViewCoordinator.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 11/8/21.
//

import Foundation
import UIKit

final class GenericWebViewCoordinator {
    
    static func build(dto: GenericWebViewCoordinatorDTO? = nil) -> UIViewController {
        
        let vc = GenericWebViewController()
        vc.url = dto?.url
        
        return vc
    }
}

struct GenericWebViewCoordinatorDTO {
    var url: String?
}

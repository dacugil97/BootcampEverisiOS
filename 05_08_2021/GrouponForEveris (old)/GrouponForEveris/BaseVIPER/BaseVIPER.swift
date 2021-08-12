//
//  BaseVIPER.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 5/8/21.
//

import Foundation
import UIKit

class BaseViewController<P>: UIViewController {
    
    var presenter: P?
    
}

class BasePresenter<V, R, I> {
    
    var vc: V?
    var router: R?
    var interactor: I?
    
    convenience init(vc: V, router: R? = nil, interactor: I? = nil) {
        self.init()
        self.vc = vc
        self.router = router
        self.interactor = interactor
    }
}

class BaseInteractor<P> {
    
    var presenter: P?
    
    convenience init(presenter: P){
        self.init()
        self.presenter = presenter
    }
}

class BaseRouter<P> {
    
    var presenter: P?
    var vc: UIViewController?
    
    convenience init(presenter: P? = nil, vc: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.vc = vc
    }
    
    func push(vc: UIViewController) {
        if let navVC = self.vc?.navigationController {
            DispatchQueue.main.async {
                navVC.pushViewController(vc, animated: true)
            }
        }
    }
    
    func present(vc: UIViewController) {
        DispatchQueue.main.async {
            self.vc?.present(vc, animated: true, completion: nil)
        }
    }
    
    func popView() {
        DispatchQueue.main.async {
            if let navVC = self.vc?.navigationController {
                navVC.popViewController(animated: true)
            }
        }
    }
    
    func dismiss() {
        self.vc?.dismiss(animated: true, completion: nil)
    }
    
}

class BaseNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

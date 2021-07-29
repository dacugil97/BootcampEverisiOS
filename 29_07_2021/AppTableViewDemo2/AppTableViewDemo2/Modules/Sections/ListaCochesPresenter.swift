//
//  ListaCochesPresenter.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

protocol ListaCochesPresenterProtocol {
    func setArrayData()
    func numberOfRowCell() -> Int
}

final class ListaCochesPresenter {
    
    let vc: ListaCochesViewProtocol = ListaCochesViewController()
    
    var arrayCoches: [CochesModel] = []
}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    
    func setArrayData() {
        self.arrayCoches = [CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi"))]
        self.vc.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        let array = self.arrayCoches.count
        self.vc.reloadData()
        return array
    }
}

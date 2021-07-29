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
    func getInformationCellRow(indexPath: Int) -> CochesModel
}

final class ListaCochesPresenter {
    
    let vc: ListaCochesViewController
    
    var arrayCoches: [CochesModel] = []
    
    init(vc: ListaCochesViewController) {
        self.vc = vc
    }
}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    
    func setArrayData() {
        self.arrayCoches.removeAll()
        self.arrayCoches = [CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi"))]
        self.vc.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCoches.count
    }
    
    func getInformationCellRow(indexPath: Int) -> CochesModel {
        return self.arrayCoches[indexPath]
    }
}

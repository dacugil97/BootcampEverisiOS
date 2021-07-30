//
//  PelisPresenter.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

protocol PelisPresenterProtocol {
    func setArrayData()
    func numberOfRowCell() -> Int
    func getInformationCellRow(indexPath: Int) -> PelisModel
}

final class PelisPresenter {
    
    let vc: PelisViewController
    
    var arrayPelis: [PelisModel] = []
    
    init(vc: PelisViewController) {
        self.vc = vc
    }
}

extension PelisPresenter: PelisPresenterProtocol {
    
    func setArrayData() {
        self.arrayPelis.removeAll()
        self.arrayPelis = [PelisModel(titulo: "Avatar", caratula: "avatar", year: 2009, calificacion: 9.8), PelisModel(titulo: "300", caratula: "300", year: 2006, calificacion: 8.7)]
        self.vc.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayPelis.count
    }
    
    func getInformationCellRow(indexPath: Int) -> PelisModel {
        return self.arrayPelis[indexPath]
    }
}

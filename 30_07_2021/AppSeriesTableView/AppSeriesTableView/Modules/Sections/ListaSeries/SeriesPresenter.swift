//
//  SeriesPresenter.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import Foundation
import UIKit

protocol SeriesPresenterProtocol {
    func setArrayData()
    func numberOfRowCell() -> Int
    func getInformationCellRow(indexPath: Int) -> SeriesModel
}

final class SeriesPresenter {
    
    let vc: SeriesViewController
    
    var arraySeries: [SeriesModel] = []
    
    init(vc: SeriesViewController) {
        self.vc = vc
    }
}

extension SeriesPresenter: SeriesPresenterProtocol {
    
    func setArrayData() {
        self.arraySeries.removeAll()
        self.arraySeries = [SeriesModel(titulo: "Modern Family", caratula: "modern_family", backdrop: "modern_family_back", year: 2009, genero: "Comedia", temporadas: 11, descripcion: "Narrada desde la perspectiva de un cineasta de documental que nunca es visto, la serie ofrece un panorama honesto y divertido, con frecuencia sobre la vida de una familia. Los padres Phil y Claire anhelan una relación honesta y abierta con sus tres hijos, pero es un gran desafío debido a sus personalidades, una adolescente que trata de crecer demasiado rápido, la otra que es demasiado inteligente para su propio bien y el hijo menor bullicioso. Jay y su esposa Gloria, quien es mucho menor que él, están criando al hijo de ella juntos pero la gente frecuentemente se equivoca al confundirlo con el padre de su esposa. Mientras tanto, la pareja Mitchell y Cameron ha adoptado una niña de Vietnam, esto genera retos diversos.", casting: "Sofía Vergara & co", calificacion: 8.4),
                            SeriesModel(titulo: "Vikings", caratula: "vikings", backdrop: "vikings_back", year: 2013, genero: "Acción, vikingos", temporadas: 5, descripcion: "El vikingo Ragnar Lothbrok es un joven agricultor y hombre de familia que se siente frustrado por las políticas de Earl Haraldson, el conde del lugar que envía a sus invasores vikingos al este de los países bálticos y Rusia, cuyos residentes son pobres como los escandinavos. Ragnar prefiere ir al oeste, al otro lado del océano, para descubrir nuevas civilizaciones. Con la ayuda de su amigo Floki, Ragnar construye una flota de barcos que lo ayudará a alcanzar el mundo occidental. A través de los años Ragnar, que dice ser un descendiente directo del dios Odín, continúa luchando con Earl hasta que los dos se enfrentan en la última batalla por la supremacía.", casting: "Katheryn Winnick & co", calificacion: 8.5)]
        self.vc.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arraySeries.count
    }
    
    func getInformationCellRow(indexPath: Int) -> SeriesModel {
        return self.arraySeries[indexPath]
    }
}

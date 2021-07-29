//
//  PerfilPresenter.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

protocol PerfilPresenterProtocol {
    func viewDidLoad()
    func setPerfilData()
    func setArrayData()
    func getDataCellForRowPost() -> Int
    func getInformationPostCell(indexPath: Int) -> PostModel
    func getInformationPerfilCell() -> PerfilModel
    
}

final class PerfilPresenter {
    
    let vc: PerfilViewController?
    
    var perfilModel: PerfilModel = PerfilModel()
    var postArrayModel: [PostModel] = []
    
    init(vc: PerfilViewController) {
        self.vc = vc
    }
}

extension PerfilPresenter: PerfilPresenterProtocol {
    
    func viewDidLoad() {
        self.setPerfilData()
        self.setArrayData()
        self.vc?.reloadData()
    }
    
    func getInformationPostCell(indexPath: Int) -> PostModel {
        return postArrayModel[indexPath]
    }
    
    func getInformationPerfilCell() -> PerfilModel {
        return perfilModel
    }
    
    func setPerfilData() {
        perfilModel = PerfilModel(imagePerfil: UIImage(named: "miranda"), name: "Miranda", perfilTwitter: "@mirandilla", puestoTrabajo: "actriz", lugarVivo: "California", numeroSeguidores: "2M")
        
        self.vc?.reloadData()
    }
    
    func setArrayData() {
        postArrayModel = [PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "thor"), name: "Thor Dios del Trueno", perfilTwitter: "@THORnado", puestoTrabajo: "Rey de Asgard", lugarVivo: "Asgard", numeroSeguidores: "Los 9 reinos"), tituloPosteo: "TQM Thor", mensajePosteo: "Hola Thor, ¿cómo te va?", fuentePosteo: "Comic Sans MS", numeroLikes: 100, numeroComentarios: 400, horaPublicacion: Date())]
        
        self.vc?.reloadData()
    }
    
    func getDataCellForRowPost() -> Int {
        return postArrayModel.count
    }
}

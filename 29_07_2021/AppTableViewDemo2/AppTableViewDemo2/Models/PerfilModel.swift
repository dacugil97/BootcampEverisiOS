//
//  PerfilModel.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import Foundation
import UIKit

struct PerfilModel {
    var imagePerfil: UIImage?
    var name: String?
    var perfilTwitter: String?
    var puestoTrabajo: String?
    var lugarVivo: String?
    var numeroSeguidores: String?
}

struct PostModel {
    var perfil: PerfilModel?
    var tituloPosteo: String?
    var mensajePosteo: String?
    var fuentePosteo: String?
    var numeroLikes: Int?
    var numeroComentarios: Int?
    var horaPublicacion: Date?
}

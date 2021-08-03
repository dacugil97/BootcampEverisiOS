//
//  Utils.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import Foundation
import UIKit

final class Utils {
    
    struct UserDefaultDDBB {
        static let prefs = UserDefaults.standard
        static let dateFormatter = DateFormatter()
    }
    
    struct Constantes {
        static let nombre = "NOMBRE"
        static let apellido = "APELLIDO"
        static let trabajo = "TRABAJO"
        static let telefono = "TELEFONO"
        static let imagenPerfil = "IMAGEN_PERFIL"
    }
    
    static func showAlertView(title: String, message: String, callBack: @escaping() -> ()) -> UIAlertController {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        return alertVC
    }
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "(yyyy-mm-dd)"
        return dateFormatter
    }()
}

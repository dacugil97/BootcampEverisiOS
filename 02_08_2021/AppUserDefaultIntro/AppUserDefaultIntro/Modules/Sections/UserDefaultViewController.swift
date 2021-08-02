//
//  UserDefaultViewController.swift
//  AppUserDefaultIntro
//
//  Created by David Cuñado Gil on 2/8/21.
//

import UIKit

class UserDefaultViewController: UIViewController {
    
    // MARK: - Constantes
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var actualizacionLbl: UILabel!
    
    
    var existeFoto = false
    
    
    // MARK: - IBActions
    @IBAction func salvarDatos(_ sender: Any) {
        
        if !(nombreTF.text?.isEmpty ?? false) && !(apellidoTF.text?.isEmpty ?? false) && !(direccionTF.text?.isEmpty ?? false) && !(telefonoTF.text?.isEmpty ?? false) && existeFoto {
            
            Utils.UserDefaultDDBB.prefs.set(self.nombreTF.text, forKey: Utils.Constantes.nombre)
            Utils.UserDefaultDDBB.prefs.set(self.apellidoTF.text, forKey: Utils.Constantes.apellido)
            Utils.UserDefaultDDBB.prefs.set(self.direccionTF.text, forKey: Utils.Constantes.direccion)
            Utils.UserDefaultDDBB.prefs.set(self.telefonoTF.text, forKey: Utils.Constantes.telefono)
            
            let fechaActual = Date()
            Utils.UserDefaultDDBB.prefs.set(fechaActual, forKey: Utils.Constantes.ultimaActualizacion)
            
            let imageData = self.imagenPerfil.image?.jpegData(compressionQuality: 0.5)
            Utils.UserDefaultDDBB.prefs.set(imageData, forKey: Utils.Constantes.imagenPerfil)
            
            present(Utils.showAlertView(title: "Hey", message: "Datos guardados :)", callBack: {
                self.nombreTF.text = ""
                self.apellidoTF.text = ""
                self.direccionTF.text = ""
                self.telefonoTF.text = ""
                self.actualizacionLbl.text = ""
                self.imagenPerfil.image = UIImage(named: "placeholder")
            }), animated: true, completion: nil)
        } else {
            present(Utils.showAlertView(title: "Por favor", message: "Introduzca todos los datos", callBack: {
                //
            }), animated: true, completion: nil)
        }
        
    }
    @IBAction func recuperarDatos(_ sender: Any) {
        
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.imagenPerfil) as? Data {
            self.imagenPerfil.image = UIImage(data: imageData)
        }
        
        Utils.UserDefaultDDBB.dateFormatter.dateStyle = .medium
        
        if let ultimaActualizacion = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.ultimaActualizacion) as? Date{
            
            self.actualizacionLbl.text = "Ultima actualizacion \(Utils.UserDefaultDDBB.dateFormatter.string(from: ultimaActualizacion as Date))"
        } else {
            self.actualizacionLbl.text = "Actualizacion no realizada"
        }
        
        if let nombreData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.nombre) {
            self.nombreTF.text = nombreData
        }
        
        if let apellidoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.apellido) {
            self.apellidoTF.text = apellidoData
        }
        
        if let direccionData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.direccion) {
            self.direccionTF.text = direccionData
        }
        
        if let telefonoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.telefono) {
            self.telefonoTF.text = telefonoData
        }
        
    }

    
    // MARK: - Ciclo de vida del controlador
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.imagenPerfil.addGestureRecognizer(tapGR)

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Metodos privados
    @objc
    func showActionGesture() {
        showPickerPhoto()
    }
    
}

extension UserDefaultViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showPickerPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let actionSheet = UIAlertController(title: "Fotos", message: "Selecciona la foto", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicker = info[.originalImage] as? UIImage {
            self.imagenPerfil.contentMode = .scaleAspectFill
            self.imagenPerfil.image = imagePicker
            self.existeFoto = true
        }
    }
}

class Utils {
    
    struct UserDefaultDDBB {
        static let prefs = UserDefaults.standard
        static let dateFormatter = DateFormatter()
    }
    
    struct Constantes {
        static let nombre = "NOMBRE"
        static let apellido = "APELLIDO"
        static let direccion = "DIRECCION"
        static let telefono = "TELEFONO"
        static let ultimaActualizacion = "ULTIMA_ACTUALIZACION"
        static let imagenPerfil = "IMAGEN_PERFIL"
    }
    
    static func showAlertView(title: String, message: String, callBack: @escaping() -> ()) -> UIAlertController {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            callBack()
        }))
        
        return alertVC
    }
}

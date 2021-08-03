//
//  LoginViewController.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables
    var existeFoto = false
    
    // MARK: - ID
    var presenter: LoginPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var trabajoTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - IBActions
    @IBAction func login(_ sender: Any) {
        
        if !(nombreTF.text?.isEmpty ?? false) && !(apellidoTF.text?.isEmpty ?? false) && !(trabajoTF.text?.isEmpty ?? false) && !(telefonoTF.text?.isEmpty ?? false) && existeFoto {
            
            let imageData = self.imagenPerfil.image?.jpegData(compressionQuality: 0.5)
            
            self.presenter?.setUserInfo(nombre: nombreTF.text, apellido: apellidoTF.text, trabajo: trabajoTF.text, telefono: telefonoTF.text, imagen: imageData)
            self.presenter?.manageSuccessfulLogin()
            
        } else {
            let av = Utils.showAlertView(title: "Por favor", message: "Introduzca todos los datos", callBack: {
                //
            })
            av.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(av, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.imagenPerfil.layer.cornerRadius = self.imagenPerfil.frame.width / 2
        self.loginBtn.layer.cornerRadius = 15
        
        self.imagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.imagenPerfil.addGestureRecognizer(tapGR)
    }
    
    @objc
    func showActionGesture() {
        choosePhotoFromLibrary()
    }

}

extension LoginViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
            self.dismiss(animated: true, completion: nil)
        }
    }
}


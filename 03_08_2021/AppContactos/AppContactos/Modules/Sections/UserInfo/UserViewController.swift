//
//  UserViewController.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - ID
    var presenter: UserPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet weak var trabajoLbl: UILabel!
    @IBOutlet weak var telefonoLbl: UILabel!
    
    // MARK: - IBActions
    @IBAction func logout(_ sender: Any) {
        
        let av = Utils.showAlertView(title: "Finalizar sesión", message: "¿Está seguro?", callBack: {
            //
        })
        av.addAction(UIAlertAction(title: "Sí", style: .default, handler: { _ in
            self.presenter?.logout()
        }))
        av.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(av, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    private func setupView() {
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.imagenPerfil) as? Data {
            self.imagenPerfil.image = UIImage(data: imageData)
        }
        self.imagenPerfil.layer.cornerRadius = 10
        self.imagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.imagenPerfil.addGestureRecognizer(tapGR)
        
        if let nombreData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.nombre) {
            self.nombreLbl.text = nombreData
        }
        
        if let apellidoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.apellido) {
            self.apellidoLbl.text = apellidoData
        }
        
        if let trabajoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.trabajo) {
            self.trabajoLbl.text = trabajoData
        }
        
        if let telefonoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.telefono) {
            self.telefonoLbl.text = telefonoData
        }
    }
    
    @objc
    func showActionGesture() {
        self.presenter?.editImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.imagenPerfil) as? Data {
            self.imagenPerfil.image = UIImage(data: imageData)
        }
    }

}

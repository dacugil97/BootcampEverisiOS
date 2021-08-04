//
//  ContactDetailViewController.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: - ID
    var presenter: ContactDetailPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet var buttons: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        if let modelData = self.presenter?.informationData(){
            self.imagenPerfil.image = UIImage(named: modelData.imageProfile ?? "placeholder")
            self.imagenPerfil.layer.cornerRadius = 10
            self.nombreLbl.text = modelData.firstName
            self.apellidoLbl.text = modelData.lastName
        }
        
        
        buttons.forEach { button in
            //button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 50, bottom: 30, right: 50)
            button.tintColor = UIColor.green
        }
 
    }

}

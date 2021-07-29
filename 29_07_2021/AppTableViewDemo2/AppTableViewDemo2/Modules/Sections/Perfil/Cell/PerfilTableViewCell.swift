//
//  PerfilTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import UIKit

protocol PerfilTableViewCellProtocol {
    func configPerfilCell(model: PerfilModel)
}

class PerfilTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var perfilImgV: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var trabajoLbl: UILabel!
    @IBOutlet weak var residenciaLbl: UILabel!
    @IBOutlet weak var seguidoresLbl: UILabel!
    
    // MARK: - IBActions
    @IBAction func enviaMail(_ sender: Any) {
    }
    
    @IBAction func compartirInfo(_ sender: Any) {
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilTableViewCell: PerfilTableViewCellProtocol {

    
    internal func configPerfilCell(model: PerfilModel) {
        self.perfilImgV.image = model.imagePerfil
        self.userLbl.text = model.perfilTwitter
        self.nombreLbl.text = model.name
        self.trabajoLbl.text = model.puestoTrabajo
        self.seguidoresLbl.text = model.numeroSeguidores
        self.residenciaLbl.text = model.lugarVivo
    }
}

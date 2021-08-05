//
//  ContactDetailTableViewCell.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import UIKit

protocol ContactDetailCellProtocol {
    func configCell(model: ArrayContact)
}

class ContactDetailCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var linkedinLbl: UILabel!
    @IBOutlet weak var descripcionLbl: UILabel!
    @IBOutlet weak var experienciaLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupView() {
        self.imagenPerfil.layer.cornerRadius = self.imagenPerfil.frame.width / 2
        self.imagenPerfil.layer.borderWidth = 1
        self.imagenPerfil.layer.borderColor = UIColor.white.cgColor
    }
}

extension ContactDetailCell: ContactDetailCellProtocol {
    func configCell(model: ArrayContact) {
        self.imagenPerfil.image = UIImage(named: model.imageProfile ?? "placeholder")
        self.nombreLbl.text = model.firstName
        self.apellidoLbl.text = model.lastName
        self.emailLbl.text = model.email
        self.linkedinLbl.text = model.cuentaLinkedin
        self.descripcionLbl.text = model.descriptionCV
        self.experienciaLbl.text = model.experienciaCV
    }
}

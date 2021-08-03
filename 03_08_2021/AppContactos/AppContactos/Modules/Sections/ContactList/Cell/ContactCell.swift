//
//  ContactCell.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

protocol ContactCellProtocol {
    func configCell(data: ArrayContact)
}

class ContactCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenContacto: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagenContacto.layer.cornerRadius = self.imagenContacto.frame.width / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactCell: ContactCellProtocol {
    func configCell(data: ArrayContact) {
        self.imagenContacto.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.nombreLbl.text = data.firstName
        self.apellidoLbl.text = data.lastName
    }
    
    
}

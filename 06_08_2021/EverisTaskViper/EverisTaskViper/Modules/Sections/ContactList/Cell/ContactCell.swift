//
//  ContactCell.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import UIKit

protocol ContactCellProtocol {
    func configCell(data: ArrayContact)
}

class ContactCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagenPerfil.layer.cornerRadius = self.imagenPerfil.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ContactCell: ContactCellProtocol {
    internal func configCell(data: ArrayContact) {
        self.imagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.nombreLbl.text = data.firstName
        self.apellidoLbl.text = data.lastName
    }
}

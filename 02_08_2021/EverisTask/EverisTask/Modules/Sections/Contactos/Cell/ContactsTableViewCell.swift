//
//  ContactsTableViewCell.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import UIKit

protocol ContactsTableViewCellProtocol {
    func configCell(data: ArrayContact)
}

class ContactsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagenPerfil.layer.cornerRadius = self.imagenPerfil.frame.width / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactsTableViewCell: ContactsTableViewCellProtocol {
    internal func configCell(data: ArrayContact) {
        self.imagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.nombreLbl.text = data.firstName
        self.apellidoLbl.text = data.lastName
    }
}

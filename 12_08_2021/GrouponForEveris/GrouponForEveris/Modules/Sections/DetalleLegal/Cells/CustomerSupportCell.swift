//
//  CustommerSupportCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 12/8/21.
//

import UIKit

protocol CustomerSupportCellProtocol {
    func configCell(data: SoporteCliente)
}

class CustomerSupportCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var telefonoLbl: UILabel!
    @IBOutlet weak var horarioLbl: UILabel!
    @IBOutlet weak var costesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CustomerSupportCell: CustomerSupportCellProtocol {
    
    func configCell(data: SoporteCliente) {
        self.emailLbl.text = data.content.email ?? ""
        self.telefonoLbl.text = data.content.phoneInternationalNumber ?? ""
        self.horarioLbl.text = data.content.operatingHours ?? ""
        self.costesLbl.text = data.content.callCharges ?? ""
    }
}

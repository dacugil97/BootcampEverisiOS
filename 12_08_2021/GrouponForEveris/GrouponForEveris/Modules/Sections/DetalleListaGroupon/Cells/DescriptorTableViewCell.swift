//
//  DescriptorTableViewCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 11/8/21.
//

import UIKit

protocol DescriptorTableViewCellProtocol {
    func configCell(model: CardViewModel)
}

class DescriptorTableViewCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var descriptorLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DescriptorTableViewCell: DescriptorTableViewCellProtocol {
    func configCell(model: CardViewModel) {
        self.descriptorLbl.text = model.finePrint
    }
    
    
}

//
//  GenericCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 6/8/21.
//

import UIKit

protocol GenericCellProtocol {
    func configCell(data: CardDataViewModel)
}

class GenericCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBoutlets
    @IBOutlet weak var genericLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GenericCell: GenericCellProtocol {
    func configCell(data: CardDataViewModel) {
        if data.isAutoRefundEnabled ?? false {
            self.genericLbl.text = "true"
        } else {
            self.genericLbl.text = "false"
        }
    }
}

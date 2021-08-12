//
//  LegalCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 12/8/21.
//

import UIKit

protocol LegalCellProtocol {
    func configCell(title: String)
}

class LegalCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LegalCell: LegalCellProtocol {
    func configCell(title: String) {
        self.titleLbl.text = title
    }
}

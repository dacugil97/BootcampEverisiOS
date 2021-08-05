//
//  ListaTareasCell.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import UIKit

class ListaTareasCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTareaLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

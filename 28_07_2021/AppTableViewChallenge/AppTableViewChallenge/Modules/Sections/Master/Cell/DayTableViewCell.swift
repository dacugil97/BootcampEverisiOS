//
//  DayTableViewCell.swift
//  AppTableViewChallenge
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

protocol DayTableViewCellProtocolo {
    func setupCell(name: String)
}

class DayTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dayLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DayTableViewCell: DayTableViewCellProtocolo {
    internal func setupCell(name: String) {
        self.dayLbl.text = name
    }
}

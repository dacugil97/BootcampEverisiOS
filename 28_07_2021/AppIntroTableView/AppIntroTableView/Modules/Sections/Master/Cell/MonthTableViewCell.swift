//
//  MonthTableViewCell.swift
//  AppIntroTableView
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

protocol MonthTableViewCellProtocolo {
    func setupCell(name: String)
}

class MonthTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MonthTableViewCell: MonthTableViewCellProtocolo {
    internal func setupCell(name: String) {
        self.mesLbl.text = name
    }
}

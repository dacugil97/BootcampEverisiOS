//
//  CocheTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import UIKit

protocol CocheTableViewCellProtocol {
    func configCell(model: CochesModel)
}

class CocheTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cocheImgV: UIImageView!
    @IBOutlet weak var marcaLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CocheTableViewCell: CocheTableViewCellProtocol {
    internal func configCell(model: CochesModel) {
        self.cocheImgV.image = model.image
        self.marcaLbl.text = model.name
        self.colorLbl.text = model.color
    }
    
    
}

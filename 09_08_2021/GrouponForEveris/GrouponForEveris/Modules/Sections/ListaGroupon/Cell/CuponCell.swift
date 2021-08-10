//
//  CuponCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 9/8/21.
//

import UIKit
import Kingfisher

protocol CuponCellProtocol {
    func configCell(data: CardViewModel)
}

class CuponCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imageCouponView: UIImageView!
    @IBOutlet weak var tendenciaLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var descripcionLbl: UILabel!
    @IBOutlet weak var precioLbl: UILabel!
    @IBOutlet weak var promocionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CuponCell: CuponCellProtocol {
    func configCell(data: CardViewModel) {
        //
    }
    
    
}

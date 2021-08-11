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

class CuponCell: UITableViewCell, ReuseIdentifierView {

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
        let url = URL(string: data.largeImageUrl ?? "")
        self.imageCouponView.layer.cornerRadius = 20
        self.imageCouponView.layer.borderColor = UIColor.gray.cgColor
        self.imageCouponView.layer.borderWidth = 1
        self.imageCouponView.kf.setImage(with: url,
                                         placeholder: UIImage(named: "placeholder"),
                                         options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
                                         ],
                                         completionHandler: nil)
        self.tendenciaLbl.text = "Tendencia"
        if !(data.tags?.isEmpty ?? true) {
            self.tagLbl.text = data.tags?[0].name ?? ""
        }
        self.precioLbl.text = "Precio \(data.priceSummary?.value?.formattedAmount ?? "")"
        self.descripcionLbl.text = data.descriptor
        self.promocionLbl.text = data.highlightsHtml
    }
}

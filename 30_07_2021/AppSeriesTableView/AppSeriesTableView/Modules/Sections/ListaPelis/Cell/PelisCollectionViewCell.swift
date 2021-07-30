//
//  PelisCollectionViewCell.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import UIKit


protocol PelisCollectionViewCellProtocol {
    func configCell(model: PelisModel)
}


class PelisCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var caratulaImgV: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var calificacionLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension PelisCollectionViewCell: PelisCollectionViewCellProtocol {
    func configCell(model: PelisModel) {
            self.caratulaImgV.image = UIImage(named: model.caratula ?? "")
            self.tituloLbl.text = model.titulo
            self.yearLbl.text = "\(String(describing: model.year!))"
            self.calificacionLbl.text = "\(String(describing: model.calificacion!))"
    }
    
    
}

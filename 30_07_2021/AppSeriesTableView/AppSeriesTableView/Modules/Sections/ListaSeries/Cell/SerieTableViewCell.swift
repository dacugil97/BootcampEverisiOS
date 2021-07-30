//
//  SerieTableViewCell.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import UIKit

protocol SerieTableViewCellProtocol {
    func configCell(model: SeriesModel)
}

class SerieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var caratulaImgV: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var temporadasLbl: UILabel!
    @IBOutlet weak var generoLbl: UILabel!
    @IBOutlet weak var calificacionLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}

extension SerieTableViewCell: SerieTableViewCellProtocol {
    
    func configCell(model: SeriesModel) {
        self.caratulaImgV.image = UIImage(named: model.caratula ?? "")
        self.tituloLbl.text = model.titulo
        self.yearLbl.text = "\(String(describing: model.year!))"
        self.temporadasLbl.text = "\(String(describing: model.temporadas!)) temporadas"
        self.generoLbl.text = model.genero
        self.calificacionLbl.text = "\(String(describing: model.calificacion!))"

    }
    
}

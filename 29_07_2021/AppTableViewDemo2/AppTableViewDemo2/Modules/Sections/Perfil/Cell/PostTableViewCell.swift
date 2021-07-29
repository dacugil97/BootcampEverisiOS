//
//  PostTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import UIKit

protocol PostTableViewCellProtocol {
    func configPostCell(model: PostModel)
}

class PostTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var perfilImgV: UIImageView!
    @IBOutlet weak var cuerpoLbl: UITextView!
    @IBOutlet weak var fuenteLbl: UILabel!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var comsLbl: UILabel!
    @IBOutlet weak var horaLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PostTableViewCell: PostTableViewCellProtocol {
    func configPostCell(model: PostModel) {
        self.nombreLbl.text = model.perfil?.name
        self.userLbl.text = model.perfil?.perfilTwitter
        self.perfilImgV.image = model.perfil?.imagePerfil
        self.tituloLbl.text = model.tituloPosteo
        self.cuerpoLbl.text = model.mensajePosteo
        self.fuenteLbl.text = model.fuentePosteo
        
        self.likesLbl.text = "Likes \(String (describing: model.numeroLikes))"
        self.comsLbl.text = "Comments \(String (describing: model.numeroComentarios))"
        self.horaLbl.text = "\(String (describing: model.horaPublicacion))"
 
    }
}

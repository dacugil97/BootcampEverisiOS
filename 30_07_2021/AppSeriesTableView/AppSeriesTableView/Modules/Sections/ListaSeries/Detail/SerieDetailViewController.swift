//
//  SerieDetailViewController.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import UIKit

class SerieDetailViewController: UIViewController {
    
    // MARK: - Variables
    var serie: SeriesModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var backdropImgV: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var calificacionLbl: UILabel!
    @IBOutlet weak var temporadasLbl: UILabel!
    @IBOutlet weak var castingLbl: UILabel!
    @IBOutlet weak var generoLbl: UILabel!
    @IBOutlet weak var descripcionTF: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
        self.backdropImgV.image = UIImage(named: serie?.backdrop ?? "")
        self.tituloLbl.text = serie?.titulo!
        self.yearLbl.text = "\(String(describing: serie?.year ?? 2000))"
        self.temporadasLbl.text = "\(String(describing: serie?.temporadas ?? 0)) temporadas"
        self.generoLbl.text = "Género: \(String(describing: serie?.genero ?? ""))"
        self.castingLbl.text = "Casting: \(String(describing: serie?.casting ?? ""))"
        self.calificacionLbl.text = "\(String(describing: serie?.calificacion ?? 0.0))"
        self.descripcionTF.text = serie?.descripcion
        self.descripcionTF.layer.cornerRadius = 15
    }
}

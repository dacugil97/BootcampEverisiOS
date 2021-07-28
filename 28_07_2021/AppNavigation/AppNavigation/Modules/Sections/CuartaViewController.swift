//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var variables = GlobalUserData()
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet weak var movilLbl: UILabel!
    @IBOutlet weak var direccionLbl: UILabel!
    @IBOutlet weak var edadPerroLbl: UILabel!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var ciudadLbl: UILabel!
    @IBOutlet weak var posGeoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nombreLbl.text = variables.nombreData
        self.apellidoLbl.text = variables.apellidoData
        self.movilLbl.text = variables.movilData
        self.direccionLbl.text = variables.direccionData
        self.edadPerroLbl.text = variables.edadPerroData
        self.postalLbl.text = variables.codigoPostalData
        self.posGeoLbl.text = variables.posGeograficaData

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

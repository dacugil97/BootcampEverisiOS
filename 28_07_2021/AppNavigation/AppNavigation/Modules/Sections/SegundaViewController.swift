//
//  SegundaViewController.swift
//  AppNavigation
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class SegundaViewController: UIViewController {

    // MARK: - Variables locales
    var variables = GlobalUserData()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet weak var edadPerroLbl: UILabel!
    @IBOutlet weak var movilTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var edadPerroTF: UITextField!
    
    // MARK: - IBActions
    @IBAction func calculaEdadPerro(_ sender: Any) {
        
        if !(self.edadPerroTF.text?.isEmpty ?? false) {
            self.edadPerroLbl.text = String(Int(self.edadPerroTF.text ?? "")! * 7)
        } else {
            present(displayAlertVC(myTitle: "Hey", myMessage: "Tienes que introducir la edad de tu perrete :)"), animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nombreLbl.text = variables.nombreData
        self.apellidoLbl.text = variables.apellidoData
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV3" {
            if !(self.movilTF.text?.isEmpty ?? false) && !(self.direccionTF.text?.isEmpty ?? false) && !(self.edadPerroTF.text?.isEmpty ?? false) {
                let vc3 = segue.destination as! TerceraViewController
                vc3.variables.nombreData = self.variables.nombreData
                vc3.variables.apellidoData = self.variables.apellidoData
                vc3.variables.movilData = self.movilTF.text
                vc3.variables.direccionData = self.direccionTF.text
                vc3.variables.edadPerroData = String(Int(self.edadPerroTF.text ?? "")! * 7)
            } else {
                present(displayAlertVC(myTitle: "Hey", myMessage: "Tienes que rellenar todos los campos"), animated: true, completion: nil)
            }
        }
    }
}

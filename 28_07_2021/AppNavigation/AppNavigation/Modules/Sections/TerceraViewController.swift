//
//  TerceraViewController.swift
//  AppNavigation
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class TerceraViewController: UIViewController {
    
    // MARK: - Variables
    var variables = GlobalUserData()
    var codigosPostalesDS = ["28001", "28002", "28003", "28004"]
    var ciudadesDS = ["Madrid", "Valladolid", "Zaragoza", "Barcelona"]
    var posicionesDS = ["1/-1", "2/-2", "3/-3", "4/-4"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var apellidoLbl: UILabel!
    @IBOutlet weak var movilLbl: UILabel!
    @IBOutlet weak var direccionLbl: UILabel!
    @IBOutlet weak var edadPerroLbl: UILabel!
    @IBOutlet weak var postalTF: UITextField!
    @IBOutlet weak var ciudadTF: UITextField!
    @IBOutlet weak var posGeoTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nombreLbl.text = variables.nombreData
        self.apellidoLbl.text = variables.apellidoData
        self.movilLbl.text = variables.movilData
        self.direccionLbl.text = variables.direccionData
        self.edadPerroLbl.text = variables.edadPerroData
        
        createPickerView(myTag: 0, myTextFieldCustom: postalTF, myArray: codigosPostalesDS)
        createPickerView(myTag: 1, myTextFieldCustom: ciudadTF, myArray: ciudadesDS)
        createPickerView(myTag: 2, myTextFieldCustom: posGeoTF, myArray: posicionesDS)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV4" {
            if !(self.postalTF.text?.isEmpty ?? false) && !(self.ciudadTF.text?.isEmpty ?? false) && !(self.posGeoTF.text?.isEmpty ?? false) {
                let vc4 = segue.destination as! CuartaViewController
                vc4.variables.nombreData = self.variables.nombreData
                vc4.variables.apellidoData = self.variables.apellidoData
                vc4.variables.movilData = self.variables.movilData
                vc4.variables.direccionData = self.variables.direccionData
                vc4.variables.edadPerroData = self.variables.edadPerroData
                vc4.variables.codigoPostalData = self.postalTF.text
                vc4.variables.ciudadData = self.ciudadTF.text
                vc4.variables.posGeograficaData = self.posGeoTF.text
            } else {
                present(displayAlertVC(myTitle: "Hey", myMessage: "Tienes que rellenar todos los campos"), animated: true, completion: nil)
            }
        }
    }
    
    private func createPickerView(myTag: Int, myTextFieldCustom: UITextField, myArray: [String]){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = myTag
        myTextFieldCustom.inputView = pickerView
        myTextFieldCustom.text = myArray[0]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension TerceraViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return codigosPostalesDS.count
        case 1:
            return ciudadesDS.count
        case 2:
            return posicionesDS.count
        default:
            return 0
        }
    }
}

extension TerceraViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return codigosPostalesDS[row]
        case 1:
            return ciudadesDS[row]
        default:
            return posicionesDS[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            variables.codigoPostalData = codigosPostalesDS[row]
            self.postalTF.text = codigosPostalesDS[row]
        case 1:
            variables.ciudadData = ciudadesDS[row]
            self.ciudadTF.text = ciudadesDS[row]
        default:
            variables.posGeograficaData = posicionesDS[row]
            self.posGeoTF.text = posicionesDS[row]
        }
    }
}

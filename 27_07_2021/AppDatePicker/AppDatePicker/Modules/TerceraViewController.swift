//
//  TerceraViewController.swift
//  AppDatePicker
//
//  Created by David Cuñado Gil on 27/7/21.
//

import UIKit

class TerceraViewController: UIViewController {
    
    // MARK: - Variables locales
    var localidadesMadridDataSource = ["La Latina", "Salamanca", "Fuencarral", "Alcobendas"]
    var codigoPostalDataSource = ["28010", "28009", "28008", "28007"]
    var prioridadesDataSource = ["ALTA", "MEDIA", "BAJA", "MUY BAJA"]
    var imagenesPerfilDataSource = ["Felipe", "Maria"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var madridTF: UITextField!
    @IBOutlet weak var postalTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagenPerfil.image = UIImage(named: imagenesPerfilDataSource[0])
        
        createPickerView(myTag: 0, myTextFieldCustom: madridTF, myArray: localidadesMadridDataSource)
        createPickerView(myTag: 1, myTextFieldCustom: postalTF, myArray: codigoPostalDataSource)
        createPickerView(myTag: 2, myTextFieldCustom: prioridadTF, myArray: prioridadesDataSource)
        
        // Do any additional setup after loading the view.
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
            return localidadesMadridDataSource.count
        case 1:
            return codigoPostalDataSource.count
        case 2:
            return prioridadesDataSource.count
        default:
            return 0
        }
    }
}

extension TerceraViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return localidadesMadridDataSource[row]
        case 1:
            return codigoPostalDataSource[row]
        default:
            return prioridadesDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            madridTF.text = localidadesMadridDataSource[row]
        case 1:
            postalTF.text = codigoPostalDataSource[row]
        default:
            prioridadTF.text = prioridadesDataSource[row]
        }
    }
}

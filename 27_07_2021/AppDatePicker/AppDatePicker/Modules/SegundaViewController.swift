//
//  SegundaViewController.swift
//  AppDatePicker
//
//  Created by David Cuñado Gil on 27/7/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    // MARK: - Variables locales
    var pickerQuesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var quesoLbl: UILabel!
    @IBOutlet weak var quesoTV: UITextView!
    @IBOutlet weak var quesoImgV: UIImageView!
    @IBOutlet weak var quesoSelV: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quesoSelV.delegate = self
        self.quesoSelV.dataSource = self

        self.title = pickerQuesosArrayData[0]
        self.quesoLbl.text = pickerQuesosArrayData[0]
        self.quesoImgV.image = UIImage(named: pickerQuesosArrayData[0])
        
        // Do any additional setup after loading the view.
    }

}

extension SegundaViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerQuesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.title = pickerQuesosArrayData[row]
        self.quesoLbl.text = pickerQuesosArrayData[row]
        self.quesoImgV.image = UIImage(named: pickerQuesosArrayData[row])
    
    }
}

extension SegundaViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerQuesosArrayData.count
    }
}

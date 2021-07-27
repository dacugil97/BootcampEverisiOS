//
//  ViewController.swift
//  AppDatePicker
//
//  Created by David Cuñado Gil on 27/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var dateTF: UITextField!
    
    @IBAction func showPickerTFAction(myTextField: UITextField) {
        let pickerDateView = UIDatePicker()
        pickerDateView.datePickerMode = .dateAndTime
        myTextField.inputView = pickerDateView
        pickerDateView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc
    func datePickerValueChanged(_ myCustomDatePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.dateLbl.text = dateFormatter.string(from: myCustomDatePicker.date)
    }
    
}


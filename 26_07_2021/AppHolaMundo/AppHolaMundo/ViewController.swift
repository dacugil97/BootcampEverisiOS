//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/7/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var holaMundoLbl: UILabel!
    @IBOutlet weak var saludoSolLbl: UILabel!
    @IBOutlet weak var constPrimerLbl: NSLayoutConstraint!
    
    // MARK: - IBActions
    
    @IBAction func cambiaNombreBtn(_ sender: Any) {
        
        self.holaMundoLbl.text = "Hola bootcamp iOS Everis"
        self.saludoSolLbl.text = "Hola Sol y hola Luna"
        self.constPrimerLbl.constant = 50
    }
    
    
    // MARK: - life VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

}


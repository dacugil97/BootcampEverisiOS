//
//  ViewController.swift
//  AppHolaMundoChallenge
//
//  Created by David Cuñado Gil on 26/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var holaLbl: UILabel!
    @IBOutlet weak var sunLbl: UILabel!
    @IBOutlet weak var holaHeight: NSLayoutConstraint!
    @IBOutlet weak var sunHeight: NSLayoutConstraint!
    
    // MARK: - IBActions
    
    @IBAction func cambiaTextos(_ sender: Any) {
        self.holaLbl.text = "Adiós mundo!"
        self.sunLbl.text = "Hola Luna"
        
        self.holaHeight.constant = 100
        self.sunHeight.constant = 100
        
        self.holaLbl.backgroundColor = UIColor.red
        self.sunLbl.backgroundColor = UIColor.green
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    
}


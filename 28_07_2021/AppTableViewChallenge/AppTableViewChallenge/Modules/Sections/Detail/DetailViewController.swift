//
//  DetailViewController.swift
//  AppTableViewChallenge
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Variables
    var nombreDia = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var dia1Lbl: UILabel!
    @IBOutlet weak var dia2Lbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dia1Lbl.text = nombreDia
        self.dia2Lbl.text = nombreDia
    }

}

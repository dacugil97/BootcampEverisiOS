//
//  SecondViewController.swift
//  AppAlerts
//
//  Created by David Cuñado Gil on 27/7/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBAction func hideVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

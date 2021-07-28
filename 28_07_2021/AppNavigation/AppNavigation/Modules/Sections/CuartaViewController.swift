//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit
import MessageUI

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
    
    
    // MARK: - IBActions
    @IBAction func enviaMail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            present(configuracionMailComposeVC(), animated: true, completion: nil)
        } else {
            present(displayAlertVC(myTitle: "Eerror", myMessage: "No puedes enviar el email"), animated: true, completion: nil)
        }
    }
    
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
    
    private func configuracionMailComposeVC() -> MFMailComposeViewController{
        
        let mailCompose = MFMailComposeViewController()
        
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients([""])
        mailCompose.setSubject("SUBJECT")
        let emailBody = "Hola colegui"
        mailCompose.setMessageBody(emailBody, isHTML: false)
        
        return mailCompose
    }

}

extension CuartaViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

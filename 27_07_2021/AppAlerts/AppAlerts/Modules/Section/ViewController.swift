//
//  ViewController.swift
//  AppAlerts
//
//  Created by David Cuñado Gil on 27/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables locales
    var loginTF: UITextField?
    var passwordTF: UITextField?
    
    
    // MARK: -IBOutlets
    @IBOutlet var uiAlertControllerSimple: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func alertVC(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            let alertVC = self.myAlertVC(myTitle: "Alert Controller Standard", myMessage: "Este alert controller es la presentación por defecto")
                        
            self.present(alertVC, animated: true, completion: nil)
            
        case 1:
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller tiene un TextField", preferredStyle: .alert)
                
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let acceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.loginTF?.text?.isEmpty ?? false){
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(identifier: "ThirdViewController")
                    vc.modalTransitionStyle = .flipHorizontal
                    self.present(vc, animated: true, completion: nil)
                }
                
            })
                
            alertVC.addAction(cancelAction)
            alertVC.addAction(acceptAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTF = textResult
                self.loginTF?.placeholder = "Introduce tu username"
            }
                
            self.present(alertVC, animated: true, completion: nil)
            
        case 2:
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller tiene un TextField", preferredStyle: .alert)
                
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                
            let acceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.loginTF?.text?.isEmpty ?? false) && !(self.passwordTF?.text?.isEmpty ?? false){
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(identifier: "ThirdViewController")
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
                
            })
                
            alertVC.addAction(cancelAction)
            alertVC.addAction(acceptAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTF = textResult
                self.loginTF?.placeholder = "Introduce tu username"
            }
            
            alertVC.addTextField { (textResult) in
                self.passwordTF = textResult
                self.passwordTF?.placeholder = "Introduce tu password"
                self.passwordTF?.isSecureTextEntry = true
            }
                
            self.present(alertVC, animated: true, completion: nil)
            
        case 3:
            let alertVC = UIAlertController(title: "Alert Controller Multiple Buttons", message: "Muchos botones", preferredStyle: .actionSheet)
            alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 3", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 4", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            self.present(alertVC, animated: true, completion: nil)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationButtons()
        // Do any additional setup after loading the view.
    }

    // MARK: - Private Methods
    
    private func customizationButtons(){
        uiAlertControllerSimple.layer.cornerRadius = 20
    }
    
    private func myAlertVC(myTitle: String, myMessage: String) -> UIAlertController {
        let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let acceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(acceptAction)
        
        return alertVC
    }
    
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func choosePhotoLibrary(){
        let imagePC = UIImagePickerController()
        imagePC.sourceType = .photoLibrary
        imagePC.delegate = self
        imagePC.allowsEditing = true
        present(imagePC, animated: true, completion: nil)
    }
}

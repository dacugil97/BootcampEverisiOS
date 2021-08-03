//
//  ImageDetailViewController.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagenPerfil: UIImageView!
    
    
    // MARK: - IBActions
    @IBAction func editImage(_ sender: Any) {
        choosePhotoFromLibrary()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.imagenPerfil) as? Data {
            self.imagenPerfil.image = UIImage(data: imageData)
        }
    }

}

extension ImageDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func choosePhotoFromLibrary() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicker = info[.originalImage] as? UIImage {
            self.imagenPerfil.contentMode = .scaleAspectFill
            self.imagenPerfil.image = imagePicker
            let imageData = self.imagenPerfil.image?.jpegData(compressionQuality: 0.5)
            Utils.UserDefaultDDBB.prefs.set(imageData, forKey: Utils.Constantes.imagenPerfil)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

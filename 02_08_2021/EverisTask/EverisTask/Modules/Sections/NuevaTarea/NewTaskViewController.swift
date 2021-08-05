//
//  NewTaskViewController.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayPrioridad = ["ALTA", "MEDIA - ALTA", "MEDIA", "BAJA", "SIN PRIORIDAD"]
    let TEXT_FIELD_LIMIT = 140
    var nombreCategoria = "Sin Categoría"
    //var CONSTANTES = Constantes()
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNuevaTareaTF: UITextField!
    @IBOutlet weak var myPrioridadNuevaTareaTF: UITextField!
    @IBOutlet weak var myFechaNuevaTarea: UITextField!
    @IBOutlet weak var myPresentaNuevaCategoriaLBL: UILabel!
    @IBOutlet weak var myCategoriaButton: UIButton!
    @IBOutlet weak var mySalvarTareaButton: UIButton!
    @IBOutlet weak var myImagenNuevaTareaIV: UIImageView!
    @IBOutlet weak var myContadorCaracteres: UILabel!
    @IBOutlet weak var descripcionTarea: UITextField!
    
    // MARK: - IBActions
    @IBAction func salvarTarea(_ sender: Any) {
        
        if let imageData: Data = self.myImagenNuevaTareaIV.image?.jpegData(compressionQuality: 0.5) {
            
            SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
                                                                              pNewTask: self.myNuevaTareaTF.text ?? "",
                                                                              pPriority: self.myPrioridadNuevaTareaTF.text ?? "",
                                                                              pTaskDate: self.myFechaNuevaTarea.text ?? "",
                                                                              pTaskDescription: self.descripcionTarea.text ?? "",
                                                                              pTaskCategory: self.myPresentaNuevaCategoriaLBL.text ?? "",
                                                                              pTaskImage: imageData)) { (success) in
                print("alert Aqui andres no mete gamba salvando datos")
            } failure: { (error) in
                print("alert Aqui andres mete gamba salvando datos")
            }
            
        }
        
    }
    
    @IBAction func muestraCategorias(_ sender: Any) {
        let vc = CategoriaViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setupView() {
        // 1
        self.mySalvarTareaButton.layer.cornerRadius = 10
        self.myCategoriaButton.layer.cornerRadius = 10
        
        // 2
        self.myImagenNuevaTareaIV.layer.cornerRadius = 8
        self.myImagenNuevaTareaIV.layer.borderWidth = 1
        self.myImagenNuevaTareaIV.layer.borderColor = UIColor.black.cgColor
        self.myImagenNuevaTareaIV.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.myImagenNuevaTareaIV.addGestureRecognizer(tapGR)
        
        // 3
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.myPrioridadNuevaTareaTF.inputView = pickerView
        self.myPrioridadNuevaTareaTF.text = arrayPrioridad[0]
        
    }
    
    @objc
    private func showActionGesture() {
        showPickerPhoto()
    }
    
}

extension NewTaskViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showPickerPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let actionSheet = UIAlertController(title: "Fotos", message: "Selecciona la foto", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicker = info[.originalImage] as? UIImage {
            self.myImagenNuevaTareaIV.contentMode = .scaleAspectFill
            self.myImagenNuevaTareaIV.image = imagePicker
            self.fotoSeleccionada = true
            dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: - DELEGATE / DATASOURCE DE PICKERVIEW
extension NewTaskViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPrioridad.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPrioridad[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myPrioridadNuevaTareaTF.text = arrayPrioridad[row]
    }
}

extension NewTaskViewController: CategoriaViewControllerDelegate {
    func nombreCategoriaSeleccionada(_ categoriaClass: CategoriaViewController, categoria row: String) {
        self.myPresentaNuevaCategoriaLBL.text = row
    }
    
    
}

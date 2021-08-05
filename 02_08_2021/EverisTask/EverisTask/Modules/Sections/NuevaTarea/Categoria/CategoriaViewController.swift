//
//  CategoriaViewController.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import UIKit

protocol CategoriaViewControllerDelegate: AnyObject {
    func nombreCategoriaSeleccionada(_ categoriaClass: CategoriaViewController, categoria row: String)
}

class CategoriaViewController: UIViewController {
    
    weak var delegate: CategoriaViewControllerDelegate?
    
    var categoriaSeleccionada = ""
    
    var selectedIndexPath = IndexPath()
    
    var listadoCategorias = ["1", "2", "3", "4", "5"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var categoriasTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayData()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupArrayData() {
        for index in 0..<listadoCategorias.count {
            if listadoCategorias[index] == categoriaSeleccionada {
                selectedIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }
    
    private func setupTableView() {
        self.categoriasTV.delegate = self
        self.categoriasTV.dataSource = self
        self.categoriasTV.register(UINib(nibName: "ListaTareasCell", bundle: nil), forCellReuseIdentifier: "ListaTareasCell")
    }

}

extension CategoriaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listadoCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCategoria = self.categoriasTV.dequeueReusableCell(withIdentifier: "ListaTareasCell", for: indexPath) as! ListaTareasCell
        cellCategoria.nombreTareaLbl.text = self.listadoCategorias[indexPath.row]
        
        return cellCategoria
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath != self.selectedIndexPath {
            selectedIndexPath = indexPath
            categoriaSeleccionada = listadoCategorias[indexPath.row]
            self.delegate?.nombreCategoriaSeleccionada(self, categoria: categoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

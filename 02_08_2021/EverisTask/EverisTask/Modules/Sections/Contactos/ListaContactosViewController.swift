//
//  ListaContactosViewController.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 2/8/21.
//

import UIKit

protocol ListaContactosViewControllerProtocol {
    func reloadDataInView()
}

class ListaContactosViewController: UIViewController {
    
    // MARK: - ID
    var presenter: ListaContactosPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaContactosTV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoadInPresent()
        
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.listaContactosTV.reloadData()
    }
    
    // MARK: - Métodos privados
    private func setupTableView() {
        self.listaContactosTV.delegate = self
        self.listaContactosTV.dataSource = self
        self.listaContactosTV.register(UINib(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsTableViewCell")
    }
    
}

extension ListaContactosViewController: ListaContactosViewControllerProtocol {
    func reloadDataInView() {
        self.listaContactosTV.reloadData()
    }

}

extension ListaContactosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellContact = self.listaContactosTV.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            cellContact.configCell(data: modelData)
        }
        
        return cellContact
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            self.presenter?.showDetailContact(dto: modelData)
        }
    }
    
}

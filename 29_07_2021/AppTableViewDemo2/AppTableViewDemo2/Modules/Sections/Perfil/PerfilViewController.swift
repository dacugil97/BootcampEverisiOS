//
//  PerfilViewController.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import UIKit

protocol PerfilViewControllerProtocol {
    func reloadData()
}

class PerfilViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var perfilTV: UITableView!
    
    // MARK: - ID
    var presenter: PerfilPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.perfilTV.delegate = self
        self.perfilTV.dataSource = self
        self.perfilTV.register(UINib(nibName: "PerfilTableViewCell", bundle: nil), forCellReuseIdentifier: "PerfilTableViewCell")
        self.perfilTV.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }

}

extension PerfilViewController: PerfilViewControllerProtocol {
    func reloadData() {
        self.perfilTV.reloadData()
    }
}

extension PerfilViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cellPerfil = self.perfilTV.dequeueReusableCell(withIdentifier: "PerfilTableViewCell", for: indexPath) as! PerfilTableViewCell
            if let modelData = self.presenter?.getInformationPerfilCell() {
                cellPerfil.configPerfilCell(model: modelData)
            }
            return cellPerfil
        default:
            let cellPost = self.perfilTV.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            
            if let modelData = self.presenter?.getInformationPostCell(indexPath: indexPath.row) {
                cellPost.configPostCell(model: modelData)
            }
            
            return cellPost
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter?.getDataCellForRowPost() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 215
        default:
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

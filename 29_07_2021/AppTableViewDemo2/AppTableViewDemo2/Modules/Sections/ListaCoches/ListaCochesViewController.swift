//
//  ListaCochesViewController.swift
//  AppTableViewDemo2
//
//  Created by David Cuñado Gil on 29/7/21.
//

import UIKit

protocol ListaCochesViewProtocol {
    func reloadData()
}

class ListaCochesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cochesTV: UITableView!
    
    // MARK: - ID
    var presenter: ListaCochesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.cochesTV.delegate = self
        self.cochesTV.dataSource = self
        self.cochesTV.register(UINib(nibName: "CocheTableViewCell", bundle: nil), forCellReuseIdentifier: "CocheTableViewCell")
    }

}

extension ListaCochesViewController: ListaCochesViewProtocol {
    func reloadData() {
        self.cochesTV.reloadData()
    }
}

extension ListaCochesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowCell() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellCoches = self.cochesTV.dequeueReusableCell(withIdentifier: "CocheTableViewCell", for: indexPath) as! CocheTableViewCell
        if let modelData = self.presenter?.getInformationCellRow(indexPath: indexPath.row){
            cellCoches.configCell(model: modelData)
        }
        return cellCoches
    }
}

extension ListaCochesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

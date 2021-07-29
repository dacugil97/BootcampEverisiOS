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
        setupTableView()
        self.presenter?.setArrayData()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.cochesTV.delegate = self
        self.cochesTV.dataSource = self
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
        return UITableViewCell()
    }
}

extension ListaCochesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

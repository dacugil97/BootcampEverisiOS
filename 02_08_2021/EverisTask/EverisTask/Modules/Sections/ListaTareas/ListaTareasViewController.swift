//
//  ListaTareasViewController.swift
//  EverisTask
//
//  Created by David Cuñado Gil on 4/8/21.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaTareasTV: UITableView!
    
    var downloads: [DownloadNewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        SaveFavoritesPresenter.shared.getAllLocal { (results) in
            self.downloads = results?.downloads
        } failure: { (error) in
            print(":(")
        }
    }
    
    private func setupTable() {
        self.listaTareasTV.delegate = self
        self.listaTareasTV.dataSource = self
        self.listaTareasTV.register(UINib(nibName: "ListaTareasCell", bundle: nil), forCellReuseIdentifier: "ListaTareasCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.setupView()
        self.listaTareasTV.reloadData()
    }
    
}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.downloads?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDownload = self.listaTareasTV.dequeueReusableCell(withIdentifier: "ListaTareasCell", for: indexPath) as! ListaTareasCell
        cellDownload.nombreTareaLbl.text = self.downloads?[indexPath.row].newTask
        return cellDownload
    }
    
    
}

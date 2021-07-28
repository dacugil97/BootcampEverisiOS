//
//  TableDayViewController.swift
//  AppTableViewChallenge
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class TableDayViewController: UITableViewController {
    
    // MARK: - Variables
    var dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    
    // MARK: - IBOutlets
    @IBOutlet var dayTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dayTV.delegate = self
        self.dayTV.dataSource = self
        self.dayTV.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: "DayTableViewCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dias.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailCoordinator.view(dto: DetailCoordinatorDTO(nombreDia: self.dias[indexPath.row]))
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dayTV.dequeueReusableCell(withIdentifier: "DayTableViewCell", for: indexPath) as! DayTableViewCell
        cell.setupCell(name: self.dias[indexPath.row])

        return cell
    }
    
}

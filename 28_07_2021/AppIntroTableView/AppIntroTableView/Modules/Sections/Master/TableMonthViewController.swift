//
//  TableMonthViewController.swift
//  AppIntroTableView
//
//  Created by David Cuñado Gil on 28/7/21.
//

import UIKit

class TableMonthViewController: UIViewController {
    
    // MARK: - Variables
    var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Noviembre", "Diciembre"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var monthsTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.monthsTV.delegate = self
        self.monthsTV.dataSource = self
        self.monthsTV.register(UINib(nibName: "MonthTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthTableViewCell")
    }
    
}

extension TableMonthViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailCoordinator.view(dto: DetailCoordinatorDTO(nombreMes: self.meses[indexPath.row]))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TableMonthViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.meses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMonths = self.monthsTV.dequeueReusableCell(withIdentifier: "MonthTableViewCell", for: indexPath) as! MonthTableViewCell
        cellMonths.setupCell(name: self.meses[indexPath.row])
        return cellMonths
    }
    
    
}

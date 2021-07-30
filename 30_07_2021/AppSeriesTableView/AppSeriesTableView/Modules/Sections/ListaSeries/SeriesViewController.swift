//
//  SeriesViewController.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import UIKit

protocol SeriesViewControllerProtocol {
    
    func reloadData()
}

class SeriesViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: SeriesPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var seriesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setArrayData()
        setupTableView()

        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        self.seriesTV.delegate = self
        self.seriesTV.dataSource = self
        self.seriesTV.register(UINib(nibName: "SerieTableViewCell", bundle: nil), forCellReuseIdentifier: "SerieTableViewCell")
        self.seriesTV.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
}

extension SeriesViewController: SeriesViewControllerProtocol {
    func reloadData() {
        self.seriesTV.reloadData()
    }

}

extension SeriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowCell() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellSerie = self.seriesTV.dequeueReusableCell(withIdentifier: "SerieTableViewCell", for: indexPath) as! SerieTableViewCell
        
        if let dataModel = self.presenter?.getInformationCellRow(indexPath: indexPath.row) {
            cellSerie.configCell(model: dataModel)
        }
        
        return cellSerie
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SerieDetailCoordinator.view(serie: self.presenter?.getInformationCellRow(indexPath: indexPath.row))
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
}

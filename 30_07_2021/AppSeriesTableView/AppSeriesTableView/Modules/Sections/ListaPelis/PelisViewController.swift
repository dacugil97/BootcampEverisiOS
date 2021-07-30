//
//  PelisViewController.swift
//  AppSeriesTableView
//
//  Created by David Cuñado Gil on 30/7/21.
//

import UIKit

protocol PelisViewControllerProtocol {
    
    func reloadData()
}

class PelisViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: PelisPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var pelisCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setArrayData()
        setupCollection()
        // Do any additional setup after loading the view.
    }
    
    private func setupCollection(){
        self.pelisCV.delegate = self
        self.pelisCV.dataSource = self
        self.pelisCV.register(UINib(nibName: "PelisCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PelisCollectionViewCell")
        self.pelisCV.isPagingEnabled = true;
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.pelisCV.collectionViewLayout = layout
    }

}

extension PelisViewController: PelisViewControllerProtocol {
    func reloadData() {
        self.pelisCV.reloadData()
    }
    
}

extension PelisViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.presenter?.numberOfRowCell() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellPeli = self.pelisCV.dequeueReusableCell(withReuseIdentifier: "PelisCollectionViewCell", for: indexPath) as! PelisCollectionViewCell
        
        if let dataModel = self.presenter?.getInformationCellRow(indexPath: indexPath.row) {
            cellPeli.configCell(model: dataModel)
        }
        
        return cellPeli
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
}

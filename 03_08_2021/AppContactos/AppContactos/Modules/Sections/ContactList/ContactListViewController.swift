//
//  ContactListViewController.swift
//  AppContactos
//
//  Created by David Cuñado Gil on 3/8/21.
//

import UIKit

protocol ContactListViewControllerProtocol {
    func reloadDataInView()
}

class ContactListViewController: UIViewController {
    
    // MARK: - ID
    var presenter: ContactListPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoadInPresent()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.contactsTV.delegate = self
        self.contactsTV.dataSource = self
        self.contactsTV.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
    }

}

extension ContactListViewController: ContactListViewControllerProtocol {
    func reloadDataInView() {
        self.contactsTV.reloadData()
    }
}

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContact = self.contactsTV.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            cellContact.configCell(data: modelData)
        }
        if indexPath.row % 2 != 0 {
            cellContact.backgroundColor = UIColor.lightGray
        } else {
            cellContact.backgroundColor = UIColor.white
        }
        return cellContact
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            self.presenter?.showDetailContact(dto: modelData)
        }
    }
    
}

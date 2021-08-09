//
//  ContactListViewController.swift
//  EverisTaskViper
//
//  Created by David Cuñado Gil on 6/8/21.
//

import UIKit

protocol ContactListViewControllerProtocol {
    func reloadTableData()
}

class ContactListViewController: BaseViewController<ContactListPresenterProtocol> {
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setData()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.contactsTV.delegate = self
        self.contactsTV.dataSource = self
        self.contactsTV.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
    }
}

extension ContactListViewController: ContactListViewControllerProtocol {
    
    func reloadTableData() {
        self.contactsTV.reloadData()
    }
}

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfContacts() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellContact = self.contactsTV.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        
        if let modelData = self.presenter?.getContactInfo(index: indexPath.row) {
            cellContact.configCell(data: modelData)
        }
        
        return cellContact
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelData = self.presenter?.getContactInfo(index: indexPath.row) {
            self.presenter?.showContactInfo(contact: modelData)
        }
    }
 
}

/*
Copyright, everisSL
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

protocol DetalleLegalViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class DetalleLegalViewController: UIViewController, ViewInterface {
    
    // MARK: - IBOutlets
    @IBOutlet weak var detalleLegalTV: UITableView!
    

    var presenter: DetalleLegalPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.detalleLegalTV.delegate = self
        self.detalleLegalTV.dataSource = self
        self.detalleLegalTV.register(UINib(nibName: LegalPolicyCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: LegalPolicyCell.defaultReuseIdentifierView)
        self.detalleLegalTV.register(UINib(nibName: CustomerSupportCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: CustomerSupportCell.defaultReuseIdentifierView)
    }

}

extension DetalleLegalViewController: DetalleLegalViewPresenterInterface {

    func reloadInformationInView() {
        
    }
}

extension DetalleLegalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.presenter.getData().label == "customerSupport" {
            let customerCell = self.detalleLegalTV.dequeueReusableCell(withIdentifier: CustomerSupportCell.defaultReuseIdentifierView) as! CustomerSupportCell
            
            customerCell.configCell(data: self.presenter.getData().value as! SoporteCliente)
            return customerCell
        } else {
            let legalCell = self.detalleLegalTV.dequeueReusableCell(withIdentifier: LegalPolicyCell.defaultReuseIdentifierView) as! LegalPolicyCell
            
            legalCell.configCell(data: self.presenter.getData().value as! PoliticaMercado)
            return legalCell
        }
    }
    
    
}

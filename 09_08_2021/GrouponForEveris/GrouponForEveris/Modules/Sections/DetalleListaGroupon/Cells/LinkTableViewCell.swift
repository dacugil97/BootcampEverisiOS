//
//  LinkTableViewCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 11/8/21.
//

import UIKit

protocol LinkTableViewCellDelegate: AnyObject {
    func sendModelData(_ cell: UITableViewCell, url: String)
}

protocol LinkTableViewCellProtocol {
    func configCell(model: CardViewModel)
}

class LinkTableViewCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - Variables
    var dataUrl: String?
    weak var delegate: LinkTableViewCellDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var linkBtn: UIButton!
    
    // MARK: - IBActions
    @IBAction func showGrouponAction(_ sender: Any) {
        
        if let dataDes = self.dataUrl {
            self.delegate.sendModelData(self, url: dataDes)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LinkTableViewCell: LinkTableViewCellProtocol {
    func configCell(model: CardViewModel) {
        self.dataUrl = model.dealUrl ?? ""
        self.linkBtn.setTitle(model.dealUrl ?? "" ,for: .normal)
    }
    
}

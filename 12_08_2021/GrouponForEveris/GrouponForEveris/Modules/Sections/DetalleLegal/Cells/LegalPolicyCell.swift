//
//  LegalPolicyCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 12/8/21.
//

import UIKit

protocol LegalPolicyCellProtocol {
    func configCell(data: PoliticaMercado)
}

class LegalPolicyCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var legalLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func parseHTML(text: String) -> NSAttributedString{
        let data = text.data(using: .unicode) ?? Data()
        let attributedString = (try? NSAttributedString(
                                    data: data,
                                    options: [.documentType: NSAttributedString.DocumentType.html],
                                    documentAttributes: nil)) ?? NSAttributedString()
        return attributedString
    }
    
}

extension LegalPolicyCell: LegalPolicyCellProtocol {
    func configCell(data: PoliticaMercado) {
        self.legalLbl.attributedText = self.parseHTML(text: data.content ?? "")
    }
}

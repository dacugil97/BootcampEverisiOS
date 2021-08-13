//
//  ViewController.swift
//  LocalizationApp
//
//  Created by David Cuñado Gil on 13/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var greetingMorningLbl: UILabel!
    @IBOutlet weak var greetingEveningLbl: UILabel!
    @IBOutlet weak var greetingNightLbl: UILabel!
    @IBOutlet weak var greetingLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greeting()
        // Do any additional setup after loading the view.
    }
    
    private func greeting() {
        self.greetingMorningLbl.text = LocalizedKeys.General.generalGreetingMorning.localized
        self.greetingEveningLbl.text = LocalizedKeys.General.generalGreetingEvening.localized
        self.greetingNightLbl.text = LocalizedKeys.General.generalGreetingNight.localized
        self.greetingLbl.text = LocalizedKeys.General.generalGreeting.localized
    }
}

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}


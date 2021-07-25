//
//  EndingViewController.swift
//  Virulentus
//
//  Created by Pablo Penas on 25/07/21.
//

import UIKit

enum ending {
    case win
    case escape
    case lost
}

class EndingViewController: UIViewController {
    
    @IBOutlet weak var backButto: UIButton!
    @IBOutlet weak var endingTextLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var result: ending = .win {
        didSet {
            updateResultLabel()
        }
    }
    
    var dayCount = 0 {
        didSet {
            dayCount(day: dayCount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButto.layer.cornerRadius = 30
        dayLabel.layer.masksToBounds = true
        dayLabel.layer.cornerRadius = 30
        switch result {
        case .win:
            self.youWon()
        case .lost:
            self.getWrecked()
        case .escape:
            self.escaped()
        }
        
        
    }
    
    func updateResultLabel() {
        switch result {
        case .win:
            self.youWon()
        case .lost:
            self.getWrecked()
        case .escape:
            self.escaped()
        }
    }
    
    func getWrecked() {
        endingTextLabel.text = "Perdeu!"
        endingTextLabel.textColor = UIColor(named: "Red")
    }
    
    func youWon() {
        endingTextLabel.text = "Venceu!"
        endingTextLabel.textColor = UIColor(named: "Green")
    }
    
    func escaped() {
        endingTextLabel.text = "Escapou!"
        endingTextLabel.textColor = UIColor(named: "DarkPurple")
    }
    
    func dayCount(day: Int) {
        dayLabel.text = "Dia \(day)"
    }
}

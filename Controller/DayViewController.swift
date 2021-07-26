//
//  DayViewController.swift
//  Virulentus
//
//  Created by Pablo Penas on 23/07/21.
//

import UIKit

class DayViewController: UIViewController {
    
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var cellCountLabel: UILabel!
    @IBOutlet weak var damageCellLabel: UILabel!
    @IBOutlet weak var totalRateLabel: UILabel!
    @IBOutlet weak var totalRecoveryLabel: UILabel!
    @IBOutlet weak var totalDamageLabel: UILabel!
    @IBOutlet weak var currentDayLabel: UILabel!
    
    var currentDay = 0.0
    var damagePerCell = 0.1
    var cellCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let totalDamage = damagePerCell * Double(cellCount)
        let totalRecovery = currentDay < 7 ? -5.0 : -15.0
        let totalRate = totalDamage + totalRecovery
        dayCountLabel.text = "Dia \(Int(currentDay))"
        cellCountLabel.text = "\(cellCount)"
        damageCellLabel.text = "\(damagePerCell)%/dia"
        totalDamageLabel.text = "\(String(format: "%.01f", totalDamage))%/dia"
        currentDayLabel.text = currentDay < 7 ? "\(String(format: "%.01f", currentDay))/IGM" : "\(String(format: "%.01f", currentDay))/IGG"
        totalRecoveryLabel.text = "\(totalRecovery)%/dia"
        totalRateLabel.text = "\(totalRate)%/dia"
        totalRateLabel.textColor = totalRate >= 0 ? UIColor(named: "Green") : UIColor(named: "Red")
    }
}

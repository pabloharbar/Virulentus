//
//  PregameViewController.swift
//  Virulentus
//
//  Created by Pablo Penas on 22/07/21.
//

import UIKit

class PregameViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 30;
    }
}

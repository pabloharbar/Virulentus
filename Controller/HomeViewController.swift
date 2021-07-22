//
//  HomeViewController.swift
//  Virulentus
//
//  Created by Pablo Penas on 22/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var howButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playButton.layer.cornerRadius = 30;
        howButton.layer.cornerRadius = 30;
    }
}

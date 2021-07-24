//
//  CollectionViewCell.swift
//  Virulentus
//
//  Created by Pablo Penas on 23/07/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    public var wasPressed: Bool = false

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var resultLabel: UILabel!
}

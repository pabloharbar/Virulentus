//
//  OrganModel.swift
//  Virulentus
//
//  Created by Pablo Penas on 22/07/21.
//

import Foundation
import UIKit

enum organs {
    case mouth
    case stomach
    case intestines
    case lungs
    case blood
    case liver
    case heart
    case brain
    case kidney
}



class Navigation: ActionModel {
    var whereTo: organs
    
    init(description: String, duration: Float, whereTo: organs) {
        self.whereTo = whereTo
        super.init(description: description, duration: duration, type: .navigation, value: whereTo)
    }
}

class Attack: ActionModel {
    let damage: Int
    
    init(description: String, duration: Float, damage: Int) {
        self.damage = damage
        super.init(description: description, duration: duration, type: .attack, value: damage)
    }
}

class Replicate: ActionModel {
    let cellGain: Int
    
    init(description: String, duration: Float, cellGain: Int) {
        self.cellGain = cellGain
        super.init(description: description, duration: duration, type: .replicate, value: cellGain)
    }
}

class Organ {
    let organ: organs
    let sceneImage: UIImage
    let title: String
    let description: String
    var navigationOptions: [Navigation]
    var attackOptions: [Attack]
    var replicateOptions: [Replicate]
    let id: Int
    
    init(organ: organs, sceneImage: UIImage, title: String, description: String,navigationOptions: [Navigation], attackOptions: [Attack], replicateOptions: [Replicate], id: Int) {
        self.organ = organ
        self.sceneImage = sceneImage
        self.title = title
        self.description = description
        self.navigationOptions = navigationOptions
        self.attackOptions = attackOptions
        self.replicateOptions = replicateOptions
        self.id = id
    }
    
    func removeReplicateOption(_ option: Replicate) {
        for i in 0..<self.replicateOptions.count {
            if replicateOptions[i].description == option.description {
                replicateOptions.remove(at: i)
            }
        }
    }
    
    func removeNavigationOption(_ option: Navigation) {
        for i in 0..<self.navigationOptions.count {
            if navigationOptions[i].description == option.description {
                navigationOptions.remove(at: i)
            }
        }
    }
    
    func removeAttackOption(_ option: Attack) {
        for i in 0..<self.attackOptions.count {
            if attackOptions[i].description == option.description {
                attackOptions.remove(at: i)
            }
        }
    }
}

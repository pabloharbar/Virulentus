//
//  ActionModel.swift
//  Virulentus
//
//  Created by Pablo Penas on 23/07/21.
//

import Foundation

enum actionTypes {
    case attack
    case replicate
    case navigation
}

class ActionModel {
    var description: String
    var duration: Float
    var type: actionTypes
    var value: Any
    
    init(description: String, duration: Float, type: actionTypes, value: Any) {
        self.description = description
        self.duration = duration
        self.type = type
        self.value = value
    }
}

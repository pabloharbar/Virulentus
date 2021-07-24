//
//  SceneBankList.swift
//  Virulentus
//
//  Created by Pablo Penas on 22/07/21.
//

import UIKit

class SceneBank {
    static var instance = SceneBank()
    
    let mouth = Organ(organ: .mouth,
                        sceneImage: UIImage(named: "mouth.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que ele tem uma ferida exposta que pode ser atacada.",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs),
                            Navigation(description: "Usar a ferida e entrar na corrente sanguínea", duration: 0.3, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida exposta", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 1)
    
    let stomach = Organ(organ: .stomach,
                        sceneImage: UIImage(named: "stomach.png")!,
                        title: "Gulp!",
                        description: "Você chegou em um lugar muito ácido e vê que não vai durar muito tempo ali. Observa um acúmulo de água que parece seguro.",
                        navigationOptions: [
                            Navigation(description: "Continuar seguindo no sistema digestivo", duration: 0.5, whereTo: .intestines),
                            Navigation(description: "Aguardar no líquido até ser levado aos rins", duration: 0.3, whereTo: .kidney)
                        ],
                        attackOptions: [
                            Attack(description: "Criar uma infecção", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 2)
    
    let lungs = Organ(organ: .lungs,
                        sceneImage: UIImage(named: "lungs.png")!,
                        title: "Quanta fumaça!",
                        description: "Parece que João fuma bastante e é uma boa oportunidade de criar um quadro mais sério aqui.",
                        navigationOptions: [
                            Navigation(description: "Acompanhar a fumaça até os brônquios e entrar na corrente sanguínea", duration: 0.5, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Causar uma pneumonia", duration: 1.2, damage: 10),
                            Attack(description: "Danificar a respiração", duration: 1.2, damage: 10)
                        ],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 3)
    
    let intestines = Organ(organ: .intestines,
                        sceneImage: UIImage(named: "intestines.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 4)
    
    let blood = Organ(organ: .blood,
                        sceneImage: UIImage(named: "blood.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 5)
    
    let liver = Organ(organ: .liver,
                        sceneImage: UIImage(named: "liver.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 6)
    
    let kidney = Organ(organ: .kidney,
                        sceneImage: UIImage(named: "kidney.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 7)
    
    let brain = Organ(organ: .brain,
                        sceneImage: UIImage(named: "brain.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 8)
    
    let heart = Organ(organ: .heart,
                        sceneImage: UIImage(named: "heart.png")!,
                        title: "Swoosh...",
                        description: "Você acabou de ser aspirado para dentro da boca de João. Observa que",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.5, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.3, whereTo: .lungs)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida", duration: 1.2, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 1.2, cellGain: 10),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.8, cellGain: 8)],
                        id: 9)
    func findOrgan(type: organs) -> Organ {
        switch type {
        case .mouth:
            return mouth
        case .stomach:
            return stomach
        case .intestines:
            return intestines
        case .lungs:
            return lungs
        case .blood:
            return blood
        case .liver:
            return liver
        case .heart:
            return heart
        case .brain:
            return brain
        case .kidney:
            return kidney
        }
    }
    init() {
        
    }
}

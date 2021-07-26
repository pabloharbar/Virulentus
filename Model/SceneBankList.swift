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
                        description: "Observa que a pessoa que o aspirou tem uma ferida exposta que pode ser atacada.",
                        navigationOptions: [
                            Navigation(description: "Usar a via do esôfago para chegar ao estômago", duration: 0.25, whereTo: .stomach),
                            Navigation(description: "Usar a via da laringe e chegar ao pulmão", duration: 0.1, whereTo: .lungs),
                            Navigation(description: "Usar a ferida e entrar na corrente sanguínea", duration: 0.6, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Atacar a ferida exposta", duration: 0.3, damage: 10)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 1)
    
    let stomach = Organ(organ: .stomach,
                        sceneImage: UIImage(named: "stomach.png")!,
                        title: "Gulp!",
                        description: "Você chegou em um lugar muito ácido e vê que não vai durar muito tempo ali. Observa um acúmulo de água que parece seguro.",
                        navigationOptions: [
                            Navigation(description: "Continuar seguindo no sistema digestivo", duration: 0.3, whereTo: .intestines),
                            Navigation(description: "Aguardar no líquido até ser levado aos rins", duration: 0.6, whereTo: .kidney)
                        ],
                        attackOptions: [
                            Attack(description: "Criar uma infecção", duration: 0.4, damage: 15)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 2)
    
    let lungs = Organ(organ: .lungs,
                        sceneImage: UIImage(named: "lungs.png")!,
                        title: "Quanta fumaça!",
                        description: "Parece que João fuma bastante e é uma boa oportunidade criar um quadro mais sério aqui.",
                        navigationOptions: [
                            Navigation(description: "Acompanhar a fumaça até o sangue", duration: 0.5, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Causar uma pneumonia", duration: 1.2, damage: 30),
                            Attack(description: "Danificar a respiração", duration: 0.7, damage: 25)
                        ],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 3)
    
    let intestines = Organ(organ: .intestines,
                        sceneImage: UIImage(named: "intestines.png")!,
                        title: "Que cheiro!",
                        description: "Vê que está passando muito material orgânico por aqui. Uma infecção seria poderosa",
                        navigationOptions: [
                            Navigation(description: "Aproveitar a absorção de nutrientes e entrar no sangue.", duration: 0.9, whereTo: .stomach),
                        ],
                        attackOptions: [
                            Attack(description: "Causar uma infecção a partir da matéria orgânica", duration: 0.8, damage: 15)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 4)
    
    let blood = Organ(organ: .blood,
                        sceneImage: UIImage(named: "blood.png")!,
                        title: "Próxima parada?",
                        description: "Essa é a via principal de navegação dentro do corpo hospedeiro. É um ótimo jeito para mudar de sistemas.",
                        navigationOptions: [
                            Navigation(description: "Ir para o pulmão", duration: 0.5, whereTo: .lungs),
                            Navigation(description: "Ir para o intestino", duration: 0.3, whereTo: .intestines),
                            Navigation(description: "Ir para os rins", duration: 0.6, whereTo: .kidney),
                            Navigation(description: "Ir para o fígado", duration: 0.6, whereTo: .liver),
                            Navigation(description: "Ir para o coração", duration: 0.6, whereTo: .heart),
                            Navigation(description: "Ir para o cérebro", duration: 0.6, whereTo: .brain)
                        ],
                        attackOptions: [],
                        replicateOptions: [],
                        id: 5)
    
    let liver = Organ(organ: .liver,
                        sceneImage: UIImage(named: "liver.png")!,
                        title: "Atenção!",
                        description: "Aqui é onde é processado as toxinas ingeridas. Tome cuidade.",
                        navigationOptions: [
                            Navigation(description: "Utilizar a via de absorção de toxinas", duration: 0.2, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Causar uma cirrose", duration: 1.2, damage: 30)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 6)
    
    let kidney = Organ(organ: .kidney,
                        sceneImage: UIImage(named: "kidney.png")!,
                        title: "Quanto sal!",
                        description: "Observa muitas barreiras para passar formadas por minerais absorvidos.",
                        navigationOptions: [
                            Navigation(description: "Entrar na corrente de absorção dos minerais", duration: 0.5, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Infeccionar o canal", duration: 0.5, damage: 20)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 7)
    
    let brain = Organ(organ: .brain,
                        sceneImage: UIImage(named: "brain.png")!,
                        title: "Bem pensado!",
                        description: "Você chegou em um órgão muito importante que possui uma defesa prória.",
                        navigationOptions: [
                            Navigation(description: "Usar a via de oxigenação para sair daqui", duration: 0.5, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Causar uma meningite", duration: 1.2, damage: 50)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
                        id: 8)
    
    let heart = Organ(organ: .heart,
                        sceneImage: UIImage(named: "heart.png")!,
                        title: "Está vivo!",
                        description: "Esses batimentos mostram que o humano ainda está vivo mas não tão saudável.",
                        navigationOptions: [
                            Navigation(description: "Aproveitar o bombeio de sangue", duration: 0.1, whereTo: .blood)
                        ],
                        attackOptions: [
                            Attack(description: "Criar uma placa de vírus", duration: 0.2, damage: 20)],
                        replicateOptions: [
                            Replicate(description: "Replicar destruindo as células hospedeiras", duration: 0.5, cellGain: 25),
                            Replicate(description: "Replicar as células infecciosas", duration: 0.3, cellGain: 12)],
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

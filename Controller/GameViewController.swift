//
//  GameViewController.swift
//  Virulentus
//
//  Created by Pablo Penas on 22/07/21.
//

import Foundation
import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // tell the collection view how many cells to make
        return currentActions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // make a cell for each cell index path
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
         // The row value is the same as the index of the desired text within the array.
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        var resultLabel = ""
        
        let action = currentActions[indexPath.row]
        
        switch action.type {
        case .attack:
            resultLabel = "+\(action.value)%      "
            resultLabel += action.duration > 1 ? "\(action.duration) dias" : "\(action.duration) dia"
//            cell.cellContainer.backgroundColor = UIColor.white
//            cell.titleLabel.textColor = .black
//            cell.resultLabel.textColor = .black
        case .navigation:
            resultLabel = action.duration > 1 ? "\(action.duration) dias" : "\(action.duration) dia"
        case .replicate:
            resultLabel = "+\(action.value) células  "
            resultLabel += action.duration > 1 ? "\(action.duration) dias" : "\(action.duration) dia"
//            cell.cellContainer.backgroundColor = UIColor(named: "Green")
//            cell.titleLabel.textColor = .black
//            cell.resultLabel.textColor = .black
        }
        
        cell.resultLabel.text = resultLabel
        cell.titleLabel.text = self.currentActions[indexPath.row].description
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
        let cell = collectionView.cellForItem(at: indexPath)
        switch currentActions[indexPath.row].type {
        case .navigation:
            currentDay += Double(currentActions[indexPath.row].duration)
            currentOrgan = SceneBank.instance.findOrgan(type: currentActions[indexPath.row].value as! organs)
            currentSelected.removeAll()
            collectionView.reloadData()
            collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
            //UPDATE CELLS
        
        case .attack:
            if !currentSelected.contains(indexPath.row) {
                currentDay += Double(currentActions[indexPath.row].duration)
                lifeTotal += currentActions[indexPath.row].value as! Int
                currentSelected.append(indexPath.row)
                cell?.layer.opacity = 0.7
            }
            
        case .replicate:
            if !currentSelected.contains(indexPath.row) {
                currentDay += Double(currentActions[indexPath.row].duration)
                cellNumber += currentActions[indexPath.row].value as! Int
                currentSelected.append(indexPath.row)
                cell?.layer.opacity = 0.7
            }
        }
    }
    
    @IBOutlet weak var cellCount: UILabel!
    
    @IBOutlet weak var dayButton: UIButton!
    
    @IBOutlet weak var lifeCount: UILabel!
    
    @IBOutlet weak var currentImage: UIImageView!
    
    @IBOutlet weak var sceneTitle: UILabel!
    
    @IBOutlet weak var sceneDescription: UILabel!
    
    var damagePerCell = 0.1
    
    var currentOrgan: Organ = SceneBank.instance.mouth {
        didSet {
            updateOrgan(currentOrgan)
            //
        }
    }
    
    var currentSelected: [Int] = []
    
    var currentActions: [ActionModel] = []
    

    var cellNumber = 1 {
        didSet {
            updateCellView(value: cellNumber)//Talvez de pau aqui
        }
    }
    
    var previousDay = 0
    
    var currentDay = 0.0 {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                self.updateDayView(Float(currentDay))
                if (self.currentDay - Double(self.previousDay)) >= 1.0{
                    self.previousDay = Int(self.currentDay)
                    self.lifeTotal += Int(Double(self.cellNumber) * self.damagePerCell) - (self.currentDay >= 8 ? 15 : 5)
                }
            }
        }
    }
    
    var result: ending = .win
    
    var _lifeTotal: Int = 0 {
        didSet {
            updateLifeView(value: lifeTotal)
        }
    }
    
    var hasEnded = false
    
    var lifeTotal: Int {
        get {
            return self._lifeTotal
        }
        
        set {
            if newValue > 0 {
                if newValue >= 100 {
                    result = .win
                    let vc = self.storyboard!.instantiateViewController(withIdentifier: "endingViewController") as! EndingViewController
                    self.show(vc, sender: self)
                    vc.result = .win
                    vc.dayCount = Int(self.currentDay)
                    vc.viewDidLoad()
                    hasEnded = true
                } else {
                    self._lifeTotal = newValue
                }
            } else if !hasEnded {
                result = .lost
                self._lifeTotal = 0
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "endingViewController") as! EndingViewController
                self.show(vc, sender: self)
                vc.result = .lost
                vc.dayCount = Int(self.currentDay)
            }
        }
    }
    
    override func viewDidLoad() {
        //Setup de tudo antes da view carregar, importar singleton
        super.viewDidLoad()
        dayButton.layer.cornerRadius = 20
        dayButton.layer.borderWidth = 1
        dayButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        cellCount.text = "\(cellNumber)"
        lifeCount.text = "\(lifeTotal)%"
        currentImage.image = currentOrgan.sceneImage
        currentActions = updateActions(currentOrgan)
        sceneTitle.text = currentOrgan.title
        sceneDescription.text = currentOrgan.description
    }
    
    func updateCellView(value: Int) {
        cellCount.text = "\(value)"
    }
    
    func updateLifeView(value: Int) {
        lifeCount.text = "\(value)%"
    }
    
    func updateOrgan(_ organ: Organ) {
        currentImage.image = currentOrgan.sceneImage
        currentActions = updateActions(currentOrgan)
        sceneTitle.text = currentOrgan.title
        sceneDescription.text = currentOrgan.description
    }
    
    func updateActions(_ organ: Organ) -> [ActionModel] {
        var sortedActions: [ActionModel] = []
        
        if organ.organ != .blood {
         
            let sortNavigation = Int.random(in: 0..<organ.navigationOptions.count)
            let sortAttack = Int.random(in: 0..<organ.attackOptions.count)
            let sortReplicate = Int.random(in: 0..<organ.replicateOptions.count)
            
            var possibleExtra: [Int] = []
            
            if organ.navigationOptions.count > 1 {
                possibleExtra.append(1)
            }
            if organ.attackOptions.count > 1 {
                possibleExtra.append(2)
            }
            if organ.replicateOptions.count > 1 {
                possibleExtra.append(3)
            }
            let sortExtra = possibleExtra.randomElement()
            
            sortedActions.append(organ.navigationOptions[sortNavigation])
            sortedActions.append(organ.attackOptions[sortAttack])
            sortedActions.append(organ.replicateOptions[sortReplicate])
            
            switch sortExtra {
                case 1:
                    var newSort = Int.random(in: 0..<organ.navigationOptions.count - 1)
                    if newSort >= sortNavigation {
                        newSort += 1
                    }
                    sortedActions.append(organ.navigationOptions[newSort])
                case 2:
                    var newSort = Int.random(in: 0..<organ.attackOptions.count - 1)
                    if newSort >= sortAttack {
                        newSort += 1
                    }
                    sortedActions.append(organ.attackOptions[newSort])
                case 3:
                    var newSort = Int.random(in: 0..<organ.replicateOptions.count - 1)
                    if newSort >= sortReplicate {
                        newSort += 1
                    }
                    sortedActions.append(organ.replicateOptions[newSort])
                default:
                    break
            }
        } else {
            var remainingOptions = organ.navigationOptions
            for _ in 0...3 {
                let sortNumber = Int.random(in: 0..<remainingOptions.count)
                sortedActions.append(remainingOptions[sortNumber])
                remainingOptions.remove(at: sortNumber)
            }
        }
        
        return sortedActions
    }
    
    func updateDayView(_ day: Float) {
        dayButton.setTitle("Dia \(Int(day))", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DayViewController {
            vc.cellCount = self.cellNumber
            vc.currentDay = self.currentDay
        }
        if let vc = segue.destination as? EndingViewController {
            vc.result = self.result
            vc.dayCount = Int(self.currentDay)
        }
    }
}

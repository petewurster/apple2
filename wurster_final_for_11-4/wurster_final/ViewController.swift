import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var GreenSegment: UISegmentedControl!
    @IBOutlet weak var YellowSegment: UISegmentedControl!
    @IBOutlet weak var RedSegment: UISegmentedControl!
    @IBOutlet weak var levelScore: UILabel!
    
    
    @IBAction func checkStatus(_ sender: UISegmentedControl) {
        levelStatus.elements.append(sender)
        levelStatus.states.append(sender.selectedSegmentIndex == 0 ? .nogo : .go)
        score -= 1
        levelScore.text! = "\(levelLabel)\t(\(score))"
        if compareStatusToComplete(levelStatus, levelComplete) == true {
            performSegue(withIdentifier: "LV2", sender: sender)
        }
    }
    
    func compareStatusToComplete(_ current: GameData, _ goal: GameData) -> Bool {
        if current.len < goal.len { return false }
        for index in (0 ..< goal.len).reversed() {
            if current.elements[index + current.len - goal.len] !== goal.elements[index] || current.states[index + current.len - goal.len] != goal.states[index] {
            return false }
        }
        return true
    }
    
    var levelStart = GameData()
    var levelStatus = GameData()
    var levelComplete = GameData()
    var levelLabel = ""
    var levelPar = 0
    var score = 0
    var totalScore = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let levelUp = segue.destination as! ViewControllerL2
        levelUp.inboundData = score
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            levelStatus = levelStart
            for index in 0 ..< levelStatus.len {
                if let element = levelStatus.elements[index] as? UISegmentedControl {
                    element.selectedSegmentIndex = levelStatus.states[index] == .nogo ? 0 : 1
                }
            }
            score = levelPar + totalScore
            levelStatus = GameData()
            levelScore.text! = "\(levelLabel)\t(\(score))"

        }
    }
    
    override func viewDidLoad() {
        var elements = [RedSegment, GreenSegment, YellowSegment]
        var states: [Status] = [.nogo, .go, .go]
        levelComplete = GameData(elements: elements as! [UIView], states: states)
        
        elements = [GreenSegment, YellowSegment, RedSegment]
        states = [.nogo, .nogo, .go]
        levelStart = GameData(elements: elements as! [UIView], states: states)
        
        levelStatus = GameData()
        
        super.viewDidLoad()
        levelPar = 3
        score = levelPar + totalScore
        levelLabel = "Level 01"
        levelScore.text! = "\(levelLabel)\t(\(score))"

    }


}


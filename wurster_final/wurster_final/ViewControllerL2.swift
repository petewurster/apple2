import UIKit

class ViewControllerL2: UIViewController {

    @IBOutlet weak var TealSegment: UISegmentedControl!
    @IBOutlet weak var LinkSegment: UISegmentedControl!
    @IBOutlet weak var IndigoSegment: UISegmentedControl!
    @IBOutlet weak var BlueSegment: UISegmentedControl!
    @IBOutlet weak var levelScore2: UILabel!
    
    @IBAction func checkStatus2(_ sender: UISegmentedControl) {
        levelStatus.elements.append(sender)
        levelStatus.states.append(sender.selectedSegmentIndex == 0 ? .nogo : .go)
        score -= 1
        levelScore2.text! = "\(levelLabel)\t(\(score))"
        if compareStatusToComplete(levelStatus, levelComplete) == true {
            performSegue(withIdentifier: "LV3", sender: sender)
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
    var totalScore = Int()
    var inboundData = Int()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let levelUp = segue.destination as! ViewControllerL3
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
            levelScore2.text! = "\(levelLabel)\t(\(score))"

        }
    }
    
    override func viewDidLoad() {
        var elements = [LinkSegment, TealSegment, IndigoSegment, BlueSegment]
        var states: [Status] = [.nogo, .go, .nogo, .go]
        levelComplete = GameData(elements: elements as! [UIView], states: states)
        
        elements = [TealSegment, LinkSegment, IndigoSegment, BlueSegment]
        states = [.nogo, .nogo, .nogo, .nogo]
        levelStart = GameData(elements: elements as! [UIView], states: states)

        levelStatus = GameData()
        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        levelPar = 6
        totalScore = inboundData
        score = levelPar + totalScore
        levelLabel = "Level 02"
        levelScore2.text! = "\(levelLabel)\t(\(score))"
    }


}



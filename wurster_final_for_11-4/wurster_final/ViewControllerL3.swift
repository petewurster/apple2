

import UIKit

class ViewControllerL3: UIViewController {

    @IBOutlet weak var levelScore3: UILabel!
    var levelStart = GameData()
    var levelStatus = GameData()
    var levelComplete = GameData()
    var levelLabel = ""
    var levelPar = 0
    var score = 0
    var totalScore = Int()
    var inboundData = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        levelPar = 0
        totalScore = inboundData
        score = levelPar + totalScore
        levelLabel = "Demo Complete!\n"
        levelScore3.text! = "\(levelLabel)Your score:\t\(score)\n (perfect score is 0)"
        // Do any additional setup after loading the view.
    }
    
}

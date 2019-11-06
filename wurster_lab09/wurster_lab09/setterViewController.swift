import UIKit

class SetterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var rawData = [Clock]()
    var topClock = Clock(0)
    var bottomClock = Clock(0)
    var pickerData = [[String]]()
    var timeStampFromTopPicker = TimeStamp(0)
    var timeStampFromBottomPicker = TimeStamp(0)


    @IBOutlet weak var topPicker: UIPickerView!
    @IBOutlet weak var bottomPicker: UIPickerView!

    func applyChanges() {
        //re-instantiate new Clocks
        timeStampFromTopPicker = TimeStamp(
            hh: topPicker.selectedRow(inComponent: 0),
            mm: topPicker.selectedRow(inComponent: 1),
            ss: topPicker.selectedRow(inComponent: 2)
        )
        topClock = Clock(timeStampFromTopPicker.computedTime)

        timeStampFromBottomPicker = TimeStamp(
            hh: bottomPicker.selectedRow(inComponent: 0),
            mm: bottomPicker.selectedRow(inComponent: 1),
            ss: bottomPicker.selectedRow(inComponent: 2))
        bottomClock = Clock(timeStampFromBottomPicker.computedTime)
    }
    
    //define picker attributes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        applyChanges()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        applyChanges()
        let segueBack = segue.destination as! ViewController
        segueBack.setterData = [topClock, bottomClock]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        topClock = rawData[0]
        bottomClock = rawData[1]
        self.topPicker.delegate = self
        self.bottomPicker.delegate = self
        //fill picker with values
        let times = Array(0 ... 59).map(String.init)
        pickerData = [times, times, times]
        
        //set default values to match current clock settings
        topPicker.selectRow(topClock.stamp.hh, inComponent: 0, animated: true)
        topPicker.selectRow(topClock.stamp.mm, inComponent: 1, animated: true)
        topPicker.selectRow(topClock.stamp.ss, inComponent: 2, animated: true)
        
        bottomPicker.selectRow(bottomClock.stamp.hh, inComponent: 0, animated: true)
        bottomPicker.selectRow(bottomClock.stamp.mm, inComponent: 1, animated: true)
        bottomPicker.selectRow(bottomClock.stamp.ss, inComponent: 2, animated: true)
    }




}

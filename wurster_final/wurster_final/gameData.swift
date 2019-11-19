import UIKit

enum Status {
    case go, nogo
}

struct GameData{
    var elements = [UIView]()
    var states = [Status]()
    var len: Int {
        elements.count
    }
}

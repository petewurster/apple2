import Foundation

struct TimeStamp {
    var hh = Int()
    var mm = Int()
    var ss = Int()
    var computedTime: Int {
        return 3600 * hh + 60 * mm + ss
    }
    var stringTime: String {
        return "\(hh) hours\n \(mm) mins\n \(ss) secs"
    }
    
    init(hh: Int, mm: Int, ss: Int) {
        let totalSeconds = 3600 * hh + 60 * mm + ss
        self.hh = totalSeconds / 3600
        self.mm = (totalSeconds % 3600) / 60
        self.ss = (totalSeconds % 3600) % 60
    }
    
    init(_ totalSeconds: Int) {
        self.hh = totalSeconds / 3600
        self.mm = (totalSeconds % 3600) / 60
        self.ss = (totalSeconds % 3600) % 60
    }
    
}

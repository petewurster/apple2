class Clock{
    var maxTime = 0
    let startMessage = "Tap to start"
    let endMessage = "You lose!"
    var isRunning = false
    var currentTime = 0
    var label: String
    var stamp = TimeStamp(0)
    
    init(_ x : Int) {
        self.stamp = TimeStamp(x)
        self.maxTime = stamp.computedTime
        self.currentTime = maxTime
        self.label = startMessage
    }
    
    //reset both clocks
    static func resetClocks(_ clocks: Clock...) {
        for clock in clocks {
            clock.isRunning = false
            clock.currentTime = clock.maxTime
            clock.stamp = TimeStamp(clock.maxTime)
            clock.label = clock.startMessage
        }
    }
    
    //as long as one clock is running, decrement currentTime and update clock label
    static func updateStatus(_ clocks: Clock...) {
        for clock in clocks {
            if clock.isRunning {
                clock.stamp = TimeStamp(clock.currentTime)
                clock.label = clock.stamp.stringTime
                clock.currentTime -= 1
                if clock.currentTime < 0 {
                    clock.label = clock.endMessage
                    clock.isRunning.toggle()
                }
            }
        }
    }
    
    //toggle clocks when tapped
    func switchClocks(_ otherClock: Clock) {
        if self.isRunning {
            self.isRunning.toggle()
            otherClock.isRunning.toggle()
        }else if !self.isRunning && !otherClock.isRunning {
            self.isRunning.toggle()
            self.label = self.stamp.stringTime
            otherClock.label = otherClock.stamp.stringTime
        }
    }
    
}

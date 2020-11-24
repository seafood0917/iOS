//: [⇐ Previous: 05 - Challenge: Properties](@previous)
//: ## Episode 06: Methods
enum Weekday: CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    mutating func advance(by dayCount: UInt) {
        let indexOfToday = Weekday.allCases.firstIndex(of: self)!
        let indexOfAdvanced = indexOfToday + Int(dayCount)
        self = Weekday.allCases[indexOfAdvanced % Weekday.allCases.count]
    }
}

var weekday: Weekday = .monday
weekday.advance(by: 4)
Weekday.allCases


struct Time {
    var day: Weekday
    var hour: UInt
    
    init(day: Weekday, hour: UInt = 0) {
        self.day = day
        self.hour = hour
    }
    
    mutating func advance(byHours hourCount: UInt) {
        self = self.advanced(byHours: hourCount)
    }
    
    func advanced(byHours hourCount: UInt) -> Time {
        var time = self
        let (dayCount, hour) = (time.hour + hourCount).quotientAndRemainder(dividingBy: 24)
        time.day.advance(by: dayCount)
        time.hour = hour
        return time
    }
}

let time = Time(day: .tuesday)
time.advanced(byHours: 24 * 3 + 5)
time
var varTime = Time(day: .tuesday)
varTime.advance(byHours: 24 * 3 + 5)
varTime.advance(byHours: 24 * 2 + 7)


// Type Methods
enum Mathematics {
    static func getLength(x: Double, y: Double) -> Double {
        return (x * x + y * y).squareRoot()
    }
}

Mathematics.getLength(x: 3, y: 4)
//: [⇒ Next: 07 - Challenge - Methods](@next)

//: [⇐ Previous: 04 - Lazy Properties](@previous)
//: ## Episode 05: Challenge - Properties

/*:
 ## Challenge 1
 Create a struct named `Temperature` with properties for degrees in both Celsius and Fahrenheit, as `Double`s.
 * _Hint 1_: One property must be stored, but the other can be computed. They should always stay in sync.
 * _Hint 2_: To convert from Fahrenheit to Celsius, subtract 32, then divide by 1.8.
*/

// TODO: Write solution here
struct Temperature {
    var fahrenheit: Double {
        didSet {
            if fahrenheit > 100 {
                print("Warning! Fahrenheit cannot be above 100 degrees.")
                fahrenheit = oldValue
            }
        }
    }
    var celsius: Double {
        get {
            return (fahrenheit - 32) / 1.8
        }
        set {
            fahrenheit = newValue * 1.8 + 32
        }
    }
}


/*:
 ## Challenge 2
 Modify the Fahrenheit property to print out a warning message if it is set to above 100 degrees.
*/
var t = Temperature(fahrenheit: 98)
t.fahrenheit = 10000
t.celsius
t.celsius = 10

/*:
 ## Challenge 3
 Make the `monthsUntilJingleBells` and `season` functions into computed properties of `Month`.
 - Computed properties must be variable
 - To refer to an enum instance inside of a computed property, use `self`
*/

// --------------------------------------
enum Season: String, CaseIterable {
  case winter, spring, summer, autumn
}
// --------------------------------------


enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  // TODO: Write solution here
  var seasonFunc: Season {
    get {
        return season(for: self)
    }
  }
  var untilJingleBells: Int {
    get {
        return monthsUntilJingleBells(from: self)
    }
  }
    
//  Or
//    var monthsUntilJingleBells: Int {
//      Month.december.rawValue - rawValue
//    }
//
//    var season: Season {
//    switch self {
//    case .december, .january, .february:
//      return .winter
//    case .march, .april, .may:
//      return .spring
//    case .june, .july, .august:
//      return .summer
//    case .september, .october, .november:
//      return .autumn
//    }
}


// --------------------------------------
func monthsUntilJingleBells(from month: Month) -> Int {
  Month.december.rawValue - month.rawValue
}

func season(for month: Month) -> Season {
  switch month {
  case .december, .january, .february:
    return .winter
  case .march, .april, .may:
    return .spring
  case .june, .july, .august:
    return .summer
  case .september, .october, .november:
    return .autumn
  }
}
// --------------------------------------


var month: Month = .april
month.seasonFunc
month.untilJingleBells
//: [⇒ Next: 06 - Methods](@next)


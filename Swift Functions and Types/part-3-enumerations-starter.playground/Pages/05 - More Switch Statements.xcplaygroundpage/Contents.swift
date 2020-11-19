//: [⇐ Previous: 04 - Switch Statements](@previous)
//: ## Episode 05: More Switch Statements

//: Switching on values
func getDescription(for number: Int) -> String {
    switch number {
    
    case 1...9:
        return "Between 1 and 9"
    case let negative where negative < 0:
        return "Negative Number"
    case _ where number > .max / 2:
        return "Very Large!"
    default:
        return "No Description"
    }
}

getDescription(for: 4)
getDescription(for: -40)
getDescription(for: Int.max)
getDescription(for: 14)

//: Switching on expressions
var numIsEven = false

func isEven(for number: Int) {
    switch number % 2 {
    case 0:
        numIsEven = true
    default:
        numIsEven = false
    }
}
isEven(for: 14)


//: Switching on multiple values
func pointCategory(for points: (Double, Double)) -> String {
    switch points {
    case (0, 0):
        return "Zero"
    case (let x, 0):
        return "On x-axis at \(x)"
    case _ where points.0 == points.1:
        return "Along y = x"
    case (let x, let y):
        return "At \(x), \(y)"
    }
}

pointCategory(for: (0, 0))
pointCategory(for: (3, 0))
pointCategory(for: (3, 3))
pointCategory(for: (4, 2))



//: [⇒ Next: 06 - Challenge - Switch Statements](@next)


//: [⇐ Previous: 05 - More Switch Statements](@previous)
//: ## Episode 06: Challenge - Switch Statements

/*:
 ## Challenge 1
 - Write a switch statement that switches on a tuple containing a `String` and an `Int`. The `String` is a name, and the `Int` is an age.
 - Use the cases below (or make up your own), and binding with `let` syntax, to assign the the name, followed by the life stage related to the age, to a `String` constant.
 
 For example, for the author of these challenges, you'd assign "Matt is an adult." to your constant.
 
 * 0-2 years: Infant
 * 3-12 years: Child
 * 13-19 years: Teenager
 * 20-39: Adult
 * 40-60: Middle aged
 * 61+: Elderly
*/

// TODO: Write solution here
func lifeStage(for info: (String, Int)) -> String {
    switch info {
    case (let name, 0...2):
        return "\(name) is an infant."
    case (let name, 3...12):
        return "\(name) is a child."
    case (let name, 13...19):
        return "\(name) is a teenager."
    case (let name, 20...39):
        return "\(name) is an adult."
    case (let name, 40...60):
        return "\(name) is a middle aged."
    case (let name, 61...):
        return "\(name) is an elderly."
    case (_, let age):
        return "Unaccounted for age: \(age)"
    }
}

lifeStage(for: ("Ozma", 70))
lifeStage(for: ("Emma", -9))



/*:
 ## Challenge 2
 Imagine starting a new level in a video game. The character makes a series of movements in the game. Calculate the position of the character on a top-down level map after making a set of movements.
 - Create a `Direction` enumeration with cases for `north`, `south`, `east`, and `west`.
 - Write a function that takes a `Direction` array and returns a tuple of two Ints representing the character's location after all of the movements.
 - Assume the character starts at (0, 0)
 
 Example: A series of movements like [.north, .west, .west] would return a location of (-2, 1)
*/

// TODO: Write solution here

enum Direction {
    case north
    case south
    case east
    case west
}

//  GOT AN ERROR!
//func getLocation(directions: [Direction]) -> (Int, Int) {
//    var start: (Int, Int) = (0, 0)
//    for direction in directions {
//        switch direction {
//        case .north:
//            start -= (1, 0)
//        case .south:
//            start -= (-1, 0)
//        case .east:
//            start -= (0, 1)
//        case .west:
//            start -= (0, -1)
//        }
//    }
//    return start
//
//}

func getLocation(directions: [Direction]) -> (x: Int, y: Int) {
//    var location: (x: Int, y: Int) = (0, 0)
//    var location: (x: 0, y: 0)
//    for direction in directions {
    directions.reduce(into: (x: 0, y: 0)) { (location, direction) in
        switch direction {
        case .north:
            location.y += 1
        case .south:
            location.y -= 1
        case .east:
            location.x += 1
        case .west:
            location.x -= 1
        }
    }
}


getLocation(directions: [.north, .west, .west])




//: [⇒ Next: 07 - Associated Values](@next)

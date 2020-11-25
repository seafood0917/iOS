//: [⇐ Previous: 07 - Protocols & Extensions](@previous)
//: ## Episode 08: Challenge - Protocols

/*:
 ## Challenge 1
 - Create a protocol `Shape` that defines a read-only property `area` of type `Double`.
 - Implement `Shape` with structs representing `Square`, `Triangle` and `Circle`.
 - Add a circle, a square and a triangle to an array. Convert the array of `Shape`s to an array of `area`s using map.
 
 **HINTS**
 - The area of a square = one of its sides squared
 - The area of a triangle = 0.5 multiplied by its base multiplied by its height
 - The area of a circle = pi multiplied by its radius squared
 - `pi` is a property of `Double`!
 - You can copy the extension on `Numeric` into this page and use the `squared` property!
*/


// TODO: Write solution here
protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        side * side
    }
}
// My first approach was using init. However, No need for using init.

struct Triangle: Shape {
    let area: Double
    
    init(base: Double, height: Double) {
        area = base * height / 2
    }
}

struct Circle: Shape {
    let area: Double
    
    init(radius: Double) {
        area = Double.pi * radius * radius
    }
}

let square = Square(side: 3)
let triangle = Triangle(base: 3, height: 3)
let circle = Circle(radius: 3)

var array: [Shape] = [square, triangle, circle]
print(array.map { $0.area })

/*:
 ## Challenge 2 Extending a Protocol
 Below is a function that takes a Double and tells you if it is an integer by comparing the Double to a rounded version of itself.
 - Turn that function into a computed property of `FloatingPoint` (a protocol that Double and other floating point numbers conform to!)
 - Try the property out on instances of `Double` and `Float`!
*/

// -----------------------------------
func isInteger(number: Double) -> Bool {
  number.rounded() == number
}
// -----------------------------------

// TODO: Write solution here
extension FloatingPoint {
    var isInteger: Bool {
//        self.rounded() == self
        rounded() == self
    } // No need for putting 'self' in front of 'rounded()'. It's assumed that I'm calling it on 'self'.
}

let double: Double = 3.3
let float: Float = 3.0

double.isInteger
float.isInteger




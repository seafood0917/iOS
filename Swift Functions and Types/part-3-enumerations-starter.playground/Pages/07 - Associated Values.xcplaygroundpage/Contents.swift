//: [⇐ Previous: 06 - Challenge - Switch Statements](@previous)
//: ## Episode 07: Enumerations with Associated Values
enum TwoDimen {
    case origin
    case onXAxis(Double)
    case onYAxis(Double)
    case noZeroCoordinate(x: Double, y: Double)
}

let point = (3.0, 0.0)
let twoPt: TwoDimen

switch point {
case (0, 0):
    twoPt = .origin
case (_, 0):
    twoPt = .onXAxis(point.0)
case (0, _):
    twoPt = .onYAxis(point.1)
default:
    twoPt = .noZeroCoordinate(x: point.0, y: point.1)
}


func getValues(for point: TwoDimen) -> (x: Double, y: Double) {
    switch point {
    case .origin:
        return (0.0, 0.0)
    case let .onXAxis(x):
        return (x, 0.0)
    case .onYAxis(let y):
        return (0.0, y)
    case let .noZeroCoordinate(x: xCor, y: yCor):
        return (xCor, yCor)
    }
}

getValues(for: .origin)
getValues(for: .onXAxis(3.2))
getValues(for: .onYAxis(4.8))
getValues(for: .noZeroCoordinate(x: 3.1, y: 5.0))


//: [⇒ Next: 08 - Conclusion](@next)

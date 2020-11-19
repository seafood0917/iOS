//: [⇐ Previous: 03 - Challenge - Closures](@previous)
//: ## Episode 04: Closure Syntaxes

// --------------------------------------
typealias Operate = (Int, Int) -> Int
// --------------------------------------


let longClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    a + b
}

let noParamTypes: Operate = {(a,b) -> Int in
    a + b
}

let noReturnType: Operate = {(a, b) in
    a + b
}

let shortClosure: Operate = {($0 + $1)}

let voidClosure: () -> Void = {
    print("Yay, Swift!")
}

longClosure(3, 2)
noParamTypes(3, 2)
noReturnType(3, 2)
shortClosure(3, 2)
voidClosure()


// --------------------------------------
func printResult(_ a: Int, _ b: Int, _ operate: Operate) {
  print(operate(a, b))
}
// --------------------------------------


printResult(3, 2, {$0 * $1 + 10})
printResult(3, 2) {$0 * $1 + 10}    // Trailing closure syntax
//: [⇒ Next: 05 - Challenge - Closure Syntaxes](@next)

//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Closures

// --------------------------------------
typealias Operate = (Int, Int) -> Int

func add(a: Int, b: Int) -> Int {
  a + b
}

func printResult(_ operate: Operate, _ a: Int, _ b: Int) {
  let result = operate(a, b)
  print(result)
}
// --------------------------------------

var operate = add

add(a: 7, b: 3)
operate(7, 3)

var addClosure: Operate = {(a: Int, b: Int) -> Int in
    a + b
}

addClosure(7, 3)

printResult({
    (a: Int, b: Int) -> Int in
   a * b + 100
}, 3, 10)
//: [⇒ Next: 03 - Challenge - Closures](@next)

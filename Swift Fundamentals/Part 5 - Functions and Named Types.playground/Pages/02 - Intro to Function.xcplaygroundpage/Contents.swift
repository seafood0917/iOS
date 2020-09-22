//: [Previous](@previous)
func printHello() {
    print("Hello!")
}

printHello()
printHello()

// -------------------
let passingGrade = 50
let chrisGrade = 49
let samGrade = 99

let chrisPassed = chrisGrade >= passingGrade
let samPassed = samGrade >= passingGrade
//--------------------

func printPassStatus(lala grade: Int, lowestPass: Int = passingGrade) {
    print(grade >= passingGrade ? "You passed!" : "Keep studying.")
}

printPassStatus(lala: samGrade)

//: [Next](@next)

//: [⇐ Previous: 04 - Overloading](@previous)
//: ## Episode 05 - Advanced Parameters

// --------------------------------------
let passingGrade = 50
let jessyGrade = 49
let ozmaGrade = 87
let ozmaAllGrades = [60, 96, 87, 42]
// --------------------------------------

//: ### Variadic Parameters
func getHighestGrade(for grades: Int...) -> Int {
    grades.max() ?? 0
}

getHighestGrade(for: jessyGrade, ozmaGrade)
getHighestGrade()
//getHighestGrade(for: ozmaAllGrades) -> error
//: ### Inout Parameters

// --------------------------------------
var count = 0
// --------------------------------------

//func incrementAndPrint(_ value: Int) {
//    value += 1
//    print(value)
//}
// 'value' is a 'let' constant.

func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}

incrementAndPrint(&count)
incrementAndPrint(&count)
incrementAndPrint(&count)
count

//: [⇒ Next: 06 - Challenge - Overloads & Parameters](@next)

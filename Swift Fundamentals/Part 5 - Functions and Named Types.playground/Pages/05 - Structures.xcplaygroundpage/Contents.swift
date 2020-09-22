//: [Previous](@previous)
struct Student {
    let name: String
    var grade: Int
    var pet: String?
    
    func getPassStatus(lowestPass: Int = 50) -> Bool {
        grade >= lowestPass
    }
    mutating func earnExtraCredit() {
        grade += 10
    }
}

var chris = Student(name: "Chris", grade: 49, pet: "Mango")
let same = Student(name: "Sam", grade: 99, pet: nil)
let catie = Student(name: "Catie", grade: 75, pet: "Ozma")

chris.getPassStatus()
chris.earnExtraCredit()
chris.getPassStatus()

//catie.grade = 100 -> error. catie is a constant 'let'
var evilCatie = catie
evilCatie.grade = 100

print(catie)
print(evilCatie)

// They are different! Structures are value types.

//: [Next](@next)

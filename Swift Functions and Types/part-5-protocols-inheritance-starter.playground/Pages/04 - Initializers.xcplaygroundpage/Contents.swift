//: [⇐ Previous: 03 - Challenge - Inheritance](@previous)
//: ## Episode 04: Initializers

class Person {
  var firstName: String
  var lastName: String
  
  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Student: Person {
  var grades: [String] = []
    
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    grades = transfer.grades
  }
}

class StudentAthlete: Student {
    var sports: [String]
    
    // override init(firstName: String, lastName: String) {     //cannot use override with required initializer
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    } // or set a default value of 'sports' as [] below
    
    convenience init(transfer: StudentAthlete) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName, sports: transfer.sports)
        grades = transfer.grades
    }
    
    init(firstName:String, lastName: String, sports: [String]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
  
}

let dan = StudentAthlete(firstName: "Daniel", lastName: "Ruettiger", sports: ["Football"])
StudentAthlete(firstName: "Daniel", lastName: "Ruettiger")
let kevin = Student(firstName: "Kevin", lastName: "Lee")
let kevin2 = Student(transfer: kevin)

StudentAthlete(transfer: dan).sports


//: [⇒ Next: 05 - Challenge: Initializers](@next)

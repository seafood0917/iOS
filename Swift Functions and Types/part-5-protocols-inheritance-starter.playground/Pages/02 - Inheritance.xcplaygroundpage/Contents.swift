//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Inheritance

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Student: Person {
  var grades: [Grade] = []
}

class SchoolBandMember: Student {
    var minimumPracticeTime: Int = 2
}


class StudentAthlete: Student {
    override var grades: [Grade] {
        get { return super.grades }
        set {
            super.grades = newValue
            if !isEligible {
                print("It's time to study!")
            }
        }
    }
    var isEligible: Bool {
        return grades.filter { $0.letter == "F" }.count < 3
    }
}

let jon = Person(firstName: "Jon", lastName: "Bob")
let dave = Student(firstName: "Dave", lastName: "Lee")
let kevin = SchoolBandMember(firstName: "Kevin", lastName: "Qin")
let joy = StudentAthlete(firstName: "Joy", lastName: "Kang")

let array = [dave, kevin, joy]

jon.firstName
dave.firstName

let historyGrade = Grade(letter: "B", points: 9, credits: 3)
dave.grades.append(historyGrade)

// Upcasting.
let student = joy as Student

// Force downcasting
let athlete = student as! StudentAthlete

// Conditional downcasting
func getEveningActivity(student: Student) -> String {
    if let bandMember = student as? SchoolBandMember {
        return "Practicing for at least \(bandMember.minimumPracticeTime)"
    } else {
        return "Hitting the books"
    }
}


student.grades.append(historyGrade)
student.grades.append(historyGrade)
// student.isEligible ---> Student does not have 'isEligible' method
athlete.isEligible

getEveningActivity(student: dave)
getEveningActivity(student: kevin)

let utterFailureGrade = Grade(letter: "F", points: 0, credits: 0)

athlete.grades.append(utterFailureGrade)
athlete.grades.append(utterFailureGrade)
athlete.grades.append(utterFailureGrade)

student.grades
//: [⇒ Next: 03 - Challenge - Inheritance](@next)

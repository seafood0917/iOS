//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Stored Properties
struct Wizard {
    static var commonIngredients = [
        "Wow-Wow Sauce",
        "Eye of Haystack"
    ] {
        willSet {
            print("Common magical ingredients are changed. Now common magical ingredients are \(newValue)")
        }
    }
    var firstName: String {
        willSet {
            print("\(firstName) will be set to \(newValue)")
        }
        didSet {
            if firstName.contains(" ") {
                print("No spaces allowed! \(firstName) is not a first name. Reverting to \(oldValue)")
                firstName = oldValue
            }
        }
    }
    var lastName: String
}

var wizard = Wizard(firstName: "Gregory", lastName: "Grayjoy")
wizard.firstName = "Hermione"
wizard.lastName = "Kenobi"
wizard.firstName = "Dave Cho"
Wizard.commonIngredients.append("Popping Blood")
Wizard.commonIngredients




//: [⇒ Next: 03 - Computed Properties](@next)

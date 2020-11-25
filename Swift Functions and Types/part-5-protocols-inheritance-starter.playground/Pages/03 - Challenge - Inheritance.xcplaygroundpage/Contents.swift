//: [⇐ Previous: 02 - Inheritance](@previous)
//: ## Episode 03: Challenge - Inheritance

/*:
## Challenge 1 - Building a Class Heirarchy
Create a class named `Animal` that has…
1. a function named `speak()` that does nothing.
 
Create two `Animal` subclasses...
1. `WildAnimal` that...
  - has an `isPoisonous` property, that is a `Bool`
  - has an initializer that takes `isPoisonous` as a parameter
2. `Pet` that...
  - has a stored property named `name`, that is a `String`
  - has an initializer that takes `name` as a parameter
  - has a `play()` method that prints out a message
  - overrides `speak()` - It should print out a message

Create one subclass of your choice of `WildAnimal` or `Pet`. It should do at least one of the following:
 - override `speak()`
 - override `play()`
 - Add a new computed property
 - Add a new method
*/


// TODO: Write solution here
class Animal {
    func speak() {
        
    }
}

class WildAnimal: Animal {
    var isPoisonous: Bool
    
    init(isPoisonous: Bool) {
        self.isPoisonous = isPoisonous
    }
}

class Pet: Animal {
    var name: String
    
    func play() {
        print("Let's play!")
    }
    
    override func speak() {
        print("Speak!")
    }
    
    init(name: String) {
        self.name = name
    }
}

class Boar: WildAnimal {
    override func speak() {
        print("Boooooooar!")
    }
}


/*:
## Challenge 2 - Casting
- Create at least one instance of each class from the first challenge.
- Create an array that contains all of the instances.
- Write a function that takes an `Animal` and does something different depending on what subclass it is. Try using conditional downcasting!
- Call the function with each of your instances using a loop or whatever other method you'd like!
*/



// TODO: Write solution here
let animal = Animal()
let pet = Pet(name: "Choco")
let wild = WildAnimal(isPoisonous: false)
let boar = Boar(isPoisonous: true)

let array = [animal, pet, wild, boar]

func doSth(animal: Animal) {
    if let sub = animal as? Pet {
        print("My pet's name is \(sub.name)")
        return
    }
    
    if let wild = animal as? WildAnimal {
        switch wild {
        case let boar as Boar:
            boar.speak()
            return
        default:
            print(wild.isPoisonous ? "Be careful! It's poisonous." : "Don't worry. It's safe.")
            return
        }
    }
    
    print("It's just an animal.")
    
}

array.forEach(doSth(animal:))
//: [⇒ Next: 04 - Initializers](@next)

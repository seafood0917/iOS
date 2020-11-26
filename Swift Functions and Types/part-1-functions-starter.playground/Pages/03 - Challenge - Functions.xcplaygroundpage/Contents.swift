//: [⇐ Previous: 02 - Functions](@previous)
//: ## Episode 03 - Challenge - Functions

/*:
 ## Challenge 1
 Write a function that:
 - Takes at least two `String` parameters
 - Has a default value for one parameter
 - Returns a `String`
 - Combines the two parameters in some way and returns the result
 
 You can add any other parameters you like, and you can modify or add anything you want to concatenated strings!
*/

// TODO: Write solution here
func challenge(first: String, last: String = "Choi") -> String {
    return first + last
}

let name = challenge(first: "Daesik")

func second(name: String, word2 word: String = "Meow") -> String {
    let adj = ["Boo", "Poo", "Koo"].randomElement()!
    let end = ["ly", "sh", "ing"].randomElement()!
    
    return adj + name.lowercased() + word + end
}

let name2 = second(name: "DAESIK")
//: [⇒ Next: 04 - Overloading](@next)

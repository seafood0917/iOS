//: [Previous](@previous)
let food: [String] = ["rice", "sushi", "ramen", "cake"]
food[0]

let three = food[1...3]
//three[0] -> error
three[1]

let newThree = Array(food[1...3])
newThree[0]

var varFood: [String] = ["rice", "sushi", "ramen", "cake"]
//varFood.removeAll() -> to use this, it has to be variable
varFood.isEmpty
varFood.count
varFood.first // It's an optional, not just a string
print(varFood.first)
if let first = varFood.first {
    print(first)
}

var num: [Int] = [1, 2, 3, 4, 5]
//num.first + 1 -> error, b/c it is an optional, not just an int.

varFood.contains("rice")
varFood.insert("tart", at: 0) // insert 'tart' into the first position
let removedTwo = varFood.remove(at:2)
let removedLast = varFood.removeLast()
removedTwo
removedLast
varFood //They are removed but returned. So can keep in track of them.


varFood[0...1] = ["brownie", "fritter", "icecream", "tart"] // change 0th and 1st item to [array]
varFood

varFood.swapAt(1, 2) // Swap the 1st and 2nd items

var lis = ["rice", "ramen", "cake"]
lis[0...0] = ["coke", "fries", "pizza", "brownie", "sushi", "kimbap"]
lis
//: [Next](@next)


//: [Previous](@previous)
let closedRange = 0...5 // Include 5
let halfOpenRange = 0..<5 // Not include 5

var usefulValue = 5
let closedRange2 = 0...usefulValue
let halfOpenRange2 = 0..<usefulValue

var sum = 0
let count = 10
for i in 1...count {
    sum += i
}
print(sum)

for _ in 1...count where count > 100 {
    print("roar")
}

for i in 1...count where i % 2 == 1{
    print("\(i) is an odd number.")
}
//: [Next](@next)

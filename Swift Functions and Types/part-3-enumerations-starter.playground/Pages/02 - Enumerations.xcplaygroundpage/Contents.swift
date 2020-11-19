//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Enumerations
enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
}

let month: Month = .october

month.rawValue

enum Season: String, CaseIterable {
    /// It's winter
    case winter
    /// Blossom!
    case spring
    /// Super hot
    case summer
    /// good weather
    case autumn
}

let winter = Season.winter
winter.rawValue
Season.allCases

//: [⇒ Next: 03 - Challenge - Enumerations](@next)

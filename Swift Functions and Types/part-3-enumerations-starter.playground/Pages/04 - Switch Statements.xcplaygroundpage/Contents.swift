//: [⇐ Previous: 03 - Challenge - Enumerations](@previous)
//: ## Episode 04: Switch Statements

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
}

enum Season: String, CaseIterable {
  /// ☃️
  case winter
  /// 🌸
  case spring
  /// 😎
  case summer
  /// 🍂
  case autumn
}

func getSeason(for month: Month) -> Season {
    switch month {
    case .november, .december, .january, .february:
        return .winter
    case .march, .april, .may:
        return .spring
    case .june, .july, .august:
        return .summer
    case .september, .october:
        return .autumn
    }
}

getSeason(for: .october)


//: [⇒ Next: 05 - More Switch Statements](@next)

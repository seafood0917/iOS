//: [Previous](@previous)
//: ## Episode 08: Nested Loops and Early Exit

let daysOfTheWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

let poolTemperature: [Int] = [78, 81, 74, 80, 79, 83, 84]

for i in 0..<daysOfTheWeek.count {
    if daysOfTheWeek[i] == "Thursday" {
        break
    }
    print("\(daysOfTheWeek[i]): \(poolTemperature[i])")
}
print("------")

for i in 0..<daysOfTheWeek.count {
    if daysOfTheWeek[i] == "Friday" {
        print("I'm in love.")
        continue
    }
    print("\(daysOfTheWeek[i]): \(poolTemperature[i])")
}
print("------")

floor_loop: for floor in 11...15 {
    if floor == 13 { //floor 13 is haunted. Ignore it.
        continue
    }
    room_loop: for room in 1...4 {
        if room == 1 { //room 1 has bad beds. Ignore it.
            continue
        }
        """
        if floor == 12 && room == 3 { // Ignore the rooms after room 2 in floor 12. (12-3, 12-4)
            continue // It will only ignore room 12-3. and print room 12-4.
        }
        """
        if floor == 12 && room == 3 { // Ignore the rooms after room 2 in floor 12. (12-3, 12-4)
            continue floor_loop // Do this instead.
        }
        print("\(floor)-\(room)")
    }
}
//: [Next](@next)

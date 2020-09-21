//: [Previous](@previous)
//: ## Episode 03: Challenge - Tuples


/*:
 ### TUPLES
 
 Declare a constant tuple named specialDate that contains three Int values followed by a String. Use this to represent a date (month, day, year) followed by a word you might associate with that day.
 */

// TODO: Write solution here
let specialDate: (Int, Int, Int, String) = (3, 5, 2016, "love")
/*:
 Create another tuple, but this time name the constituent components. Give them names related to the data that they contain: month, day, year and description.
 */


// TODO: Write solution here

//let date: (Int, Int, Int, String) = (month: 3, day: 5, year: 2016, description: "love")
//This won't map the keys and values. Do instead
let date = (month: 3, day: 5, year: 2016, description: "love")
/*:
 In one line, read the day and description values into two constants. You’ll need to use the underscore to ignore the month and year.
 */

// TODO: Write solution here

let (_, day, _, description) = date
day
description


/*:
 Up until now, you’ve only seen constant tuples. But you can create variable tuples, too. Create one more tuple, like in the exercises above, but this time use var instead of let. Now change the day to a new value. */

// TODO: Write solution here
var varDate = (month: 9, day: 7, year: 2020, description: "today")
varDate.description = "Chainging"
//: [Next](@next)

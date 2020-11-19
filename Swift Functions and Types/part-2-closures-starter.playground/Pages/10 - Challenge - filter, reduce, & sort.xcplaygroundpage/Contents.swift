//: [⇐ Previous: 09 - filter, reduce, and sort](@previous)
//: ## Episode 10: Challenge - filter, reduce, and sort

/*:
 ## Challenge Time 😎
 
 Create a constant array called `names` which contains some names as strings (any names will do — make sure there’s more than three though!). Now use `reduce` to create a string which is the concatenation of each name in the array.
*/
let names = ["Dan", "Suji", "Ken", "Eiden", "Nivea"]

var longName = names.reduce("") { (concat, name) -> String in
    concat + name
}



/*:
 Using the same `names` array, first filter the array to contain only names which have more than four characters in them, and then create the same concatenation of names as in the above exercise. (Hint: you can chain these operations together.)
*/
var long4Name = names.filter({ (name) -> Bool in
    name.count > 4
}).reduce("") { (concat, name) -> String in
    concat + name
}




/*:
 Create a constant dictionary called `namesAndAges` which contains some names as strings mapped to ages as integers. Now use `filter` to create a dictionary containing only people under the age of 18.
*/
let namesAndAges = ["Ken" : 24, "Suji" : 15, "Eiden" : 30, "Ben": 10]
let under18 = namesAndAges.filter { (item) -> Bool in
    item.value < 18
}
print(under18)



/*:
 Using the same `namesAndAges` dictionary, filter out the adults (those 18 or older) and then use `map` to convert to an array containing just the names (i.e. drop the ages).
*/
let adults = namesAndAges.filter { (item) -> Bool in
    item.value > 18
}
.map { (item) -> String in
    item.key
}


//: [⇒ Next: 11 - Conclusion](@next)

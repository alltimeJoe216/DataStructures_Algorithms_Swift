import UIKit

// Full syntax
var dict = Dictionary<Int, String>()

// Shorthand

var shortDict = [Int:String]()

// Dictionary literal
var myDick: [Int: String] = [1: "One", 2: "Two", 3: "Three"]

/*
 Adding/Modifying/removing a KV pair
 */

myDick.updateValue("Four", forKey: 4)
// if key does not exist, the pair will be added, otherwise, existing pair is updated

myDick[5] = "Five" // add (or update) using subscript

// Remove
let removedPair = myDick.removeValue(forKey: 1)

/*/
 Retrieving values
 */

// Subscripts will return vlaues from given key. It's optional bc it can not exist

if let optResult = myDick[4] {
    print(optResult)
} else {
    print("Key not found")
}

//

let states = [ "AL" : "Alabama", "CA" : "California", "AK" : "Alaska", "AZ" : "Arizona", "AR" : "Arkansas"]

for (stateAbbr, stateName) in states {
    print("State abbrev: \(stateAbbr), state name: \(stateName)")
}

// retrieve only keys
for (stateAbbr) in states.keys { // this can be done with values
//    print("State Abberviation: \(stateAbbr)")
}

/*
 
 Sort dictionary
 
 */

let sortedArrayFromDictionary = Array(states.sorted(by: <))
print(sortedArrayFromDictionary)

for (key) in sortedArrayFromDictionary.map({$0.0}) {
    print("The mfin key: \(key)")
}

for (value) in sortedArrayFromDictionary.map({$0.1}) {
    print("The MFin value: \(value)")
}



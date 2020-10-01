// Full syntax
var array = Array<Int>()

// Short hand
array = [Int]()

// Capacity
array.count // 0

array.reserveCapacity(500) // contains 500 indices

// Literal
var intLiteralArray: [Int] = [1, 2, 3, 4, 5]

/*
 Adding and updating elements
 */

var intArray = [Int]()
intArray.append(50) //[50]

// Append a collection

intArray.append(contentsOf: [1, 1, 2, 3, 4])

// Insert at specific index

intArray.insert(20, at: 2)

// Replace at certain index
intArray[2] = 63


/*
 Retrieving and removing elements
 */

// by element
intArray[5] // returns 5th index of array

//retrieve by subrange
intArray[2..<5] // Returns elements between index 2 and less than index 5

intArray[2...5] // Returns index 2-5

// iterate
for element in intArray {
    print(element)
}

intArray.contains(50) // boolean for whether array contains value





func binarySearch(array: [Int], item: Int) -> Int? {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low+high)
        let guess = array[mid]
        
        if guess == item {
            return mid
        }
        
        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}

var myArray = [1, 3, 5, 7, 9]
binarySearch(array: myArray, item: 5)

import UIKit

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // Push the actual value we want to insert
    // mutating func because we want to modify our stuct
    mutating func push(_ value: Value) {
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        
        // if link list is empty, utilize push
        // check if it is NOT empty first
        guard !isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail?.next = node
        tail = node
    }
    
    mutating func node(at index: Int) -> Node<Value>? {
        // Find the node using index
        // Say next node is the one i'm trying to insert
        // Not an array so we have to go looking for it
        // Takes in integer, returns the index
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func insert(_ value: Value, after node: Node<Value>) {
        
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> Value? {
        
        defer { // return the value, after it has returned, execute the defer block
            head = head?.next
            if isEmpty {
                tail = nil
            }
            
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        // return nil if there is no tail
        guard let head = head else {
            return nil
        }
        
        // what about if there is a single element?
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        
        // search through LL
        while let next = current.next {
            // going through LL til we hit value that next == nil
            previous = current // one prvious from tail
            current = next
        }
        
        previous.next = nil
        tail = previous
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            // always going to point to NEXT node after the user inserts
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    init() { }
}

extension LinkedList : CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
    
    
}

// Node will hold values of any type. using generics

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// For pretty return statement
extension Node : CustomStringConvertible {
    var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//
//node1.next = node2 // 1 -> 2
//node2.next = node3 // 2 -> 3

var list = LinkedList<Int>()

// MARK: - Push operation for link list
// 10 -> 1 -> 3 -> nil
// we want to insert 22, it will replace 10 and insert at head. 3 is still tail. You awalys push TO The HEAD
//list.push(1)
//list.push(3)
//list.push(5)

//print(list)

//MARK: - Append to Linked List
// This adds to the tail level

list.append(10)
list.append(3)
list.append(12)
list.append(100)

//print(list)

//MARK: - Insert
// This to insert nodes BETWEEN nodes
// Sart by moving the node next to the one you want to insert next to, then insert


let     dleNode = list.node(at: 1) // represets 3 above (index 1)


list.insert(999, after: middleNode!)
//print(list)

//MARK: Pop - Remove item at HEAD LEVEL

list.pop()

//print(list)

//MARK: - Remove LAST

list.removeLast()

//print(list)

//MARK: - Remove AFTER

let firstNode = list.node(at: 0)
// Before 3->999->12
// After 3->12
list.remove(after: firstNode!)
//print(list)



//MARK: - STACKS(LAST IN FIRST OUT)
/*____________________________________________________________*/


struct Stack<Element> {
    private var storage: [Element] = []
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    // LAST IN FIRST OUT
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---------top--------\n"
        let bottomDivider = "\n----------------"
        
        let stackElements = storage.map{ "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(20)
stack.push(30)
stack.push(50)
//print(stack)
stack.pop()
//print(stack)

//MARK: - Queue (FIRST IN FIRST OUT)
/*____________________________________________________________*/

struct Queue<T> {
    
    var array: [T] = []
    
    init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? { // Get only
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
    array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

var q = Queue<Int>()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)

//print(q)

q.dequeue()

//print(q)

/* MARK: - RECURSION
 _____________________*/

func increment(index :Int) -> Int {
    increment(index: index) // Recursive case, where is basecase that will end this loop?
    
    var counter = index
    counter += 1
    // base case
    if counter < 10 { // base case
        return increment(index: counter) // recurisve case
    } else {
        return counter
    }
}

/* MARK: - TREEEEES
 __________________*/

// Solved problems including representing/managing heirarchel data, manage sorted data, fast look up

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

let beverages = TreeNode<String>(value: "Beverages")

let hot = TreeNode<String>(value: "Hot Beverages")
let cold = TreeNode<String>(value: "Cold Beverages")
let tea = TreeNode(value: "Tea")
let coffee = TreeNode(value: "Coffee")
let icedCoffee = TreeNode(value: "Iced Coffee")
let milk = TreeNode(value: "Milk")
let soda = TreeNode(value: "Soda")
cold.add(soda)
cold.add(milk)
cold.add(icedCoffee)
hot.add(coffee)
hot.add(tea)


beverages.add(hot)
beverages.add(cold)

/*
    Beverages
    /       \
   /         \
  hot       cold
 
 
 right now it just prints an array of beverages, but this is what the tree node looks like
 
 */

/* MARK: - Depth First Traversal
 Traverses straight down (to the depths of the treenode) LEFT side first of beverages then right side
 
 DFT are mostly done using recursion.
 */

extension TreeNode {
    
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        
        visit(self) // fire the closure passing in the tree node (root node, hopefully)
        children.forEach { // * forEach. Nice
            $0.forEachDepthFirst(visit) // for each child, do the same thing
        }
    }
}
beverages.forEachDepthFirst {
    print($0.value)
}

/* MARK: - Bubble Sort */

var numbers = [2, 6, 13, 31, 78, 5, 55, 99, 22, 1]

//print("Array before sorted")
//print(numbers)

for i in 0..<numbers.count {
    
    for j in 0..<numbers.count {
        //check if numbers of i is greater than number of j
        
        if(numbers[i]) < numbers[j] {
            /* MARK: - This was first example before replacing 3 lines with 1 line below. same thing happens
            //swap the numbers if so
            let tempVar = numbers[i]
            numbers[i] = numbers[j] // sort in ascending order
            
            //finally assign numbers of J to numbers of I (temp var)
            numbers[j] = tempVar
            */
            
            numbers.swapAt(i, j)
            
        }
    }
}
//print("Array after sorted")
//print(numbers) // The loop above sorts in descending order when i > j, we changed to i < j after seeing this and now it is ascending

/* MARK: - Selection Sort
 
 point to first item of array, the find the minimum element in the array (lowest value)
 
 then swap that min element to the current index item (most likely index 0 of array)
 
 then move pointer to next position index (index 1)
 
 repeat
 
 */

var numbers2 = [11, 90, 82, 41, 14, 5, 77, 108, 45, 94, 1]

print("Array Before sorted: \(numbers2)")

var minIndex = 0 // holds index of the minimum/smallest item in array

for i in 0..<numbers2.count {
    
    minIndex = i
    
    for j in (i+1)..<numbers2.count { // going to search for the min index, not going to start with i bc it already is the min index...so i + 1
        
        if (numbers2[j] < numbers2[minIndex]) { // we have found a new min index
            minIndex = j
        }
        
        // now swap
        numbers2.swapAt(i, minIndex)
    }
}
//print("Array after sorting: \(numbers2)")

/* MARK: - INSERT SORT
 
 start at index 1
 
 index 1 is going to be matched against all previous #'s
 
 (is index 1 less than index 0?)
 
 once swap has been done, move up to next index (2)
 */

for i in 0..<numbers2.count {
    
    // get key
    let key = numbers2[i]
    
    // compare key against
    var j = i - 1 // one less than key
    
    
           //index > 0?       // if this is greater than the key (number)
    while (j >= 0) && numbers2[j] > key {
        
        numbers2[j+1] = numbers2[j]
        j = j - 1
    }
    
    numbers2[j+1] = key // whatever value of j was, + 1 to it and assign key to it
}

print("Array after sorting: \(numbers2)")









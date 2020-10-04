class Node<T> {
    var next:Node<T>?
    var data: T
    
    init(data: T) {
        next = nil
        self.data = data
    }
}

public struct StackList<T> {
    
    // HEAD & COUNT & INIT
    fileprivate var head: Node<T>? = nil
    private var _count: Int = 0
    public init() {}
    
    // PUSH **
    public mutating func push(element: T) {
        let node = Node<T>(data: element)
        node.next = head
        head = node
        _count += 1
    }
    
    // POP **
    public mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        
        // Get the item of the head node.
        let item = head?.data
        
        // Remove the head node.
        head = head?.next
        
        // decrement number of elements
        _count -= 1
        
        return item
    }
    
    // PEEK **
    public func peek() -> T? {
        return head?.data
    }
    
    // ISEMPTY **
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    // COUNT **
    public var count: Int {
        return _count
    }
}

extension StackList: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
    
    
    public var debugDescription: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
}

var myStack = StackList<Int>()

myStack.push(element: 34)
myStack.push(element: 77)
myStack.push(element: 67)
// [67, 77, 34]

var x = myStack.pop()
x = myStack.pop()
x = myStack.pop()
x = myStack.pop() // now nil


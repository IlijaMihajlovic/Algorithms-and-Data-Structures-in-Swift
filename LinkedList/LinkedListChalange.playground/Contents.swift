
import Foundation

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> "  + String(describing: next) + " "
    }
}




extension LinkedList: CustomStringConvertible {
    
    // A textual represtentation of that instance
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //---------------------------------------------------
    // 1. Create a function that prints out the elements of a linked list in reverse order.
    //Time Complexity Big O(n) since we have to traverse each node of the list.

    
    //A straightforward way to solve this problem is to use recursion. Since recursion allows you to build a call stack, you just need to call the print statements as the call stack unwinds.
    
      func printInReverse<T>(_ node: Node<T>?) {
        
        //  We first start off with the base case: the condition to terminating the recursion. If node is nil, then it means we’ve reached the end of the list.
        guard let node = node else {  return }
        
        // This is our recursive call, calling the same function with the next node.
        printInReverse(node.next)
        print(node.value)
    }
    
    //Finally, we need to call the helper method from the original printInReverse function.
   func printInReverse<T>(_ list: LinkedList<T>) {
        printInReverse(list.head)
    }
    //-------------------------------------------------
    
    // 2. Create a function that returns the middle node of a linked list.  Big O(n)
    
    // The solution is to have two references traverse down the nodes of the list where one is twice as fast as the other. Once the faster reference reaches the end, the slower reference will be in the middle.
    
    func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
        var slow = list.head
        var fast = list.head
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        return slow
    }
       //In the while declaration, we bind the next node to nextFast. If there is a next node, we update fast to the next node of nextFast, effectively traversing down the list twice. The slow pointer is updated only once. This is also known as the runner’s technique.

    

    
}
    
extension LinkedList{
    
    // 3. Create a function  that reveres a linked list.
    //To reverse a linked list, you need to visit each node and update the next reference to point in the other direction. This can be a tricky task, since you’ll need to manage multiple references to multiple nodes.
    
    mutating func reverse() {
        //We assigning head to tail
        tail = head
      // next we create two references — prev and current — to keep track of traversal.
       // The strategy is fairly straightforward: each node points to the next node down the list
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        //Each time we perform the reversal, you create a new reference to the next node
        while current != nil {
            let next = current?.next
            current?.next = prev
            //After every reversal procedure, we move the two pointers to the next two nodes.
            prev = current
            current = next
        }
        //Once we’ve finished reversing all the pointers, you’ll set the head to the last node of this list
        head = prev
    }

}


print("\nPrint In Reverse")
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print("Original list: \(list)")
print("Printing in reverse:")
LinkedList<Int>().printInReverse(list)

print("\nGetting the middle node")
var listMiddleNode = LinkedList<Int>()
listMiddleNode.push(3)
listMiddleNode.push(2)
listMiddleNode.push(1)

print(listMiddleNode)

if let middleNode = LinkedList<Int>().getMiddle(listMiddleNode) {
    print(middleNode)
}


var listReverse = LinkedList<Int>()
listReverse.push(3)
listReverse.push(2)
listReverse.push(1)
print("Original list: \(listReverse)")
listReverse.reverse()
print("Reversed list: \(listReverse)")

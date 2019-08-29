
//---------------------------------------------------------------------------

//in order to modify value types like structs whe need to include the mutating keyword to our function
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

// Now we gonna build a Linked List that manages the Node objects
public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    
   // ----------------------------------------Insert A Value--------------------------------------
    
    /* Adding a value at the front of the list is known as a push operation or head-first insertion
    Big O(1)
     */
    
    /* In case in which we're pusing into an empty list, the new node is both the head and tail of the
     list */
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    
    // Append Node To Tail Big O(1)
    
    /* Append means we're adding a value at the end of the list, and this is also known as tail-end
     insertion */
    
    public mutating func apped(_ value: Value) {
        
        // If the list is empty, we’ll need to update both head and tail to the new node. Since append on an empty list is functionally identical to push, we simply invoke push to do the work for us.
        guard !isEmpty else {
            push(value)
            return
        }
        
        // In all other cases, we simply create a new node after the tail node. Force unwrapping is guaranteed to succeed since we push in the isEmpty case with the above guard statement.
        tail!.next = Node(value: value)
        
        
        // Since this is tail-end insertion, our new node is also the tail of the list.
        tail = tail!.next
    }
    
    
    /* Inser After operation inserts a value at a particular place in the list, and requires two steps:
     1. Finding a particular node in the list.
     2. Inserting the new node */
    
  /* The function tries to retrieve a node in the list based on the given index. Since we can only access the nodes of the list from the head node, we’ll have to make iterative traversals.
     Hers how it goes: */
    
    public func findNode(at index: Int) -> Node<Value>? {
        
        // We create a new reference to head and keep track of the current number of traversals.
        var currentNode = head
        var currentIndex = 0
        
        // Using a while loop, you move the reference down the list until you’ve reached the
        //desired index. Empty lists or out-of-bounds indexes will result in a nil return value.
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    
    // Insert node After  Big O(1)
    
    // @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        // In the case where this method is called with the tail node, you’ll call the functionally equivalent append method. This will take care of updating tail.
        guard tail !== node else {
            apped(value)
            return tail!
        }
        //Otherwise, you simply link up the new node with the rest of the list and return the new node.
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    //-----------------------------Remove A Value--------------------------
    
    //Pop operation Big O(1)
    //* Removing a value at the front of the list is often referred to as pop.
    
    // By moving the head down a node, we’ve effectively removed the first node of the list. ARC will remove the old node from memory once the method finishes, since there will be no more references attached to it. In the event that the list becomes empty, we set tail to nil.
    @discardableResult
    public mutating func pop() -> Value? {
        
    //A defer statement is used for executing code just before transferring program control outside of the scope that the defer statement appears in.
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    

    //Remove last operation Big O(n)
    @discardableResult
    public mutating func removeLast() -> Value? {
        
        //If head is nil, there’s nothing to remove, so you return nil.
        guard let head = head else {
            return nil
        }
      
        //If the list only consists of one node, removeLast is functionally equivalent to pop. Since pop will handle updating the head and tail references, you’ll just delegate this work to it.
        guard head.next != nil else {
            return pop()
        }
        
        //You keep searching for a next node until current.next is nil. This signifies that current is the last node of the list.
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        //Since current is the last node, you simply disconnect it using the prev.next reference. You also make sure to update the tail reference.
        prev.next = nil
        tail = prev
        return current.value
    }
    
    
    //Remove after Opertation. We'll first find the node immediately before the node we wish to remove, and then unlink it. Big O(1)
    
    //The unlinking of the nodes occurs in the defer block. Special care needs to be taken if the removed node is the tail node, since the tail reference will need to be updated.
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    
}



//--------------Testing----------------
print("Creating and linking nodes")

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

print("\nPush")
var list  = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
print(list)

print("\nAppend")
var listAppend = LinkedList<Double>()
listAppend.apped(1)
listAppend.apped(2)
listAppend.apped(3)
print(listAppend)

print("Inserting at a particular index")
var listInsert = LinkedList<Int>()
listInsert.push(3)
listInsert.push(2)
listInsert.push(1)

print("\nBefore inserting: \(listInsert)")
var middleNode = listInsert.findNode(at: 1)!
for _ in 1...4 {
    middleNode = listInsert.insert(-1, after: middleNode)
}
print("After inserting: \(listInsert)")

print("Pop")
var listPop = LinkedList<Float64>()
listPop.push(3)
listPop.push(2)
listPop.push(8)

print("Before popping list: \(listPop)")
let poppedValue = listPop.pop()
print("After popping list: \(listPop)")
print("Popped value: " + String(describing: poppedValue))


print("Remove last node")
var listLastNode = LinkedList<Int>()
listLastNode.push(5)
listLastNode.push(2)
listLastNode.push(1)

print("Before removing last node: \(listLastNode)")
let removedValue = listLastNode.removeLast()
print("After removing last node: \(listLastNode)")
print("Removed value: " + String(describing: removedValue))

print("Remove a node after a particular node")
var listRemoveAfter = LinkedList<Double>()
listRemoveAfter.push(3)
listRemoveAfter.push(2)
listRemoveAfter.push(1)

print("Before removing at particular index: \(list)")
let index = 1
let node = listRemoveAfter.findNode(at: -1)!
let removedValue2 = listRemoveAfter.remove(after: node)
print("After removing at index \(index): \(listRemoveAfter)")
print("Removed value: " + String(describing: removedValue2))






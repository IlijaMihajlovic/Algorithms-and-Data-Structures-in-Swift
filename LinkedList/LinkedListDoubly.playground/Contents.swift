
import Foundation

//T is a generic type, so T can be any kind of data we'd like to store.
public class LinkedListNode<T> {
    
    //Our doubly linked list has a next and previous pointer. Those can be nil if there are no next or previus nodes
    var value: T
    var next: LinkedListNode?
    //to avoid ownership cycles, we declare the previous pointer to be weak
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}


public class LinkedList<T> {
    
    //Ideally, we would want a class name to be as descriptive as possible, yet, we don't want to type a long name every time we want to use the class, therefore, we're using a typealias so inside LinkedList we can write the shorter Node instead of LinkedListNode<T>.
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        // it keeps looping until node.next is nil.
        while let next = node.next {
            node = next
        }
        return node
    }
    
    
    public func append(value: T) {
        
        //We first create a new Node object
        let newNode = Node(value: value)
        
        // then ask for the last node using the last property we've just added.
        if let lastNode = last {
           
            //if we did find a valid node object, we connect the next and previous pointers to link this new node into the chain
            newNode.previous = lastNode
            lastNode.next = newNode
            
            // // If there is no such node, the list is still empty and we make head point to this new Node
        } else {
            head = newNode
        }
    }
    
    
    // It loops through the list and increments a counter with every interation
    public var countNodes: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    
    public func findNode(atIndex index: Int) -> Node {
        
        //First we check whether the given index is 0 or not. Because if it is 0, it returns the head as it is
        if index == 0 {
            return head!
            
           // However, when the given index is greater than 0, it starts at head then keeps following the node.next pointers to step through the list
        } else {
            var node = head!.next
            //Here the for in loop reaches the index, and are able to acquire the node of the given index
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    print("Index Out Of Range")
                    break
                }
            }
            return node!
        }
    }
    
    //Subscript like by an Array
    public subscript(index: Int) -> T {
        let node = findNode(atIndex: index)
        return node.value
    }
    
    //Remove all nodes
    public func removeAll() {
        head = nil
    }
    
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    //  //To reverse a linked list, you need to visit each node and update the next reference to point in the other direction. This can be a tricky task, since you’ll need to manage multiple references to multiple nodes.
    public func reverse() {
        
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


extension LinkedListNode: CustomStringConvertible {
    
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

let list = LinkedList<String>()

list.append(value: "Hello")
list.append(value: "Swift")
list.append(value: "World")
list.first?.next?.value
list.last?.previous?.value
//list.remove(node: list.first!.next!)
list.countNodes
print(list)
list.reverse()
print(list)
//list.removeAll()
//list.isEmpty
//list.countNodes


//list.findNode(atIndex: 1).value
//list[0]
list.first
list.countNodes

//list.isEmpty
//list.first?.value
//list.last?.value

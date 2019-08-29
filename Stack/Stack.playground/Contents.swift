
//Stack LIFO (last in first out)

//Stacks are used prominently in all disciplines of programming. To list a few:
/* • iOS uses the navigation stack to push and pop view controllers into and out of view.
   • Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack.
   • Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking. */

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
    
    //Push and Pop both have a Big O(1) time complexity
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
  // @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    //// The idea of peek is to look at the top element of the stack without mutating its contents.
    public func peek() -> Element? {
        return storage.last
    }
    
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
}

//Choosing the right storage type for stack is important. The array is an obvious choice, since it offers constant time insertions and deletions at one end via append and popLast. Usage of these two operations will facilitate the LIFO nature of stacks.

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack  = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
print(stack)


print("Popped: \(String(describing: stack.pop()))")

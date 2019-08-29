
// The main advantage of using linked list over an arrays is that it is possible to implements a stack that can shrink or grow as much as needed. In using array will put a restriction to the maximum capacity of the array which can lead to stack overflow

import Foundation

class Node<Element> {
    
    let value: Element
    var next: Node?
    init(value: Element) {
        self.value = value
    }
    // Swift dosent alow us to create value and next instances without initializing them first.
}


class Stack<Element> {
    
    var top: Node<Element>?
    
    func push(_ value: Element) {
        //We add our first added element we will needed in second
        let oldTop = top
        // Here we initlize a new top
        top = Node(value: value)
        //At the end we add our first added element as the top
        top?.next = oldTop
    }
    
    func pop() -> Element? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    // The idea of peek is to look at the top element of the stack without mutating its contents.
    func peek() -> Element? {
        return top?.value
    }
}


let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

let firstPop = stack.pop() // 3
let secondPop = stack.pop()
let peek = stack.peek()
let thirdPop = stack.pop()
let finalPop = stack.pop()


import XCTest

//Tests for If The Linked List Contains a Cycle/Loop function
//the 'function' and the rest of the code is in the LinkedList.playground file

class Tests: XCTestCase {

    func testLinkedListWithNoCycle() {
        let nodes = linkedListNodes(from: [1, 2, 3, 4])
        let result = containsCycle(firstNode: nodes[0])
        XCTAssertFalse(result)
    }

    func testCycleLoopsToBeginning() {
        let nodes = linkedListNodes(from: [1, 2, 3, 4])
        nodes[3].next = nodes[0]
        let result = containsCycle(firstNode: nodes[0])
        XCTAssertTrue(result)
    }

    func testCycleLoopsToMiddle() {
        let nodes = linkedListNodes(from: [1, 2, 3, 4, 5])
        nodes[4].next = nodes[2]
        let result = containsCycle(firstNode: nodes[0])
        XCTAssertTrue(result)
    }

    func testTwoNodeCycleAtEnd() {
        let nodes = linkedListNodes(from: [1, 2, 3, 4, 5])
        nodes[4].next = nodes[3]
        let result = containsCycle(firstNode: nodes[0])
        XCTAssertTrue(result)
    }

    func testOneElementLinkedListNoCycle() {
        let firstNode = LinkedListNode(1)
        let result = containsCycle(firstNode: firstNode)
        XCTAssertFalse(result)
    }

    func testOneElementLinkedListCycle() {
        let firstNode = LinkedListNode(1)
        firstNode.next = firstNode
        let result = containsCycle(firstNode: firstNode)
        XCTAssertTrue(result)
    }

    private func linkedListNodes(from values: [Int]) -> [LinkedListNode<Int>] {
        var nodes: [LinkedListNode<Int>] = []
        for (index, value) in values.enumerated() {
            nodes.append(LinkedListNode(value))
            if index > 0 {
                nodes[index - 1].next = nodes[index]
            }
        }
        return nodes
    }

    static let allTests = [
        ("testLinkedListWithNoCycle", testLinkedListWithNoCycle),
        ("testCycleLoopsToBeginning", testCycleLoopsToBeginning),
        ("testCycleLoopsToMiddle", testCycleLoopsToMiddle),
        ("testTwoNodeCycleAtEnd", testTwoNodeCycleAtEnd),
        ("testOneElementLinkedListNoCycle", testOneElementLinkedListNoCycle),
        ("testOneElementLinkedListCycle", testOneElementLinkedListCycle)
    ]
}

XCTMain([testCase(Tests.allTests)])

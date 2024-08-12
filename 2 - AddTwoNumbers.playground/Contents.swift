import Cocoa
/*
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

Example 1:


Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
 

Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
*/

func _addTwoNumbers(_ l1: ListNode<Int>?, l2: ListNode<Int>?, carryOver: Int = 0) -> ListNode<Int>? {
    guard l1 != nil || l2 != nil  else {
        return carryOver > 0 ? ListNode(carryOver) : nil
    }

    let sum = addTwoNumber(l1?.val, val2: l2?.val, carryOver: carryOver)
    return ListNode(sum.unit, _addTwoNumbers(l1?.next, l2: l2?.next, carryOver: sum.carryOver))
    
}

func addTwoNumber(_ val1: Int?, val2: Int?, carryOver: Int) -> (unit: Int, carryOver: Int) {
    var sum = carryOver
    if let val1 = val1 {
        sum += val1
    }
    
    if let val2 = val2 {
        sum += val2
    }
    
    return (unit: sum % 10, carryOver: sum / 10)
}

public class ListNode<T> {
    var val: T
    var next: ListNode?
    
    init(_ val: T) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: T, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    func printList() {
        print(val)
        var currentNode = next
        while let node = currentNode {
            print(node.val)
            currentNode = node.next
        }
    }
}

public func addTwoNumbers(_ l1: ListNode<Int>?, l2: ListNode<Int>?) -> ListNode<Int>? {
    _addTwoNumbers(l1, l2: l2)
}



// Define a LinkedList class
class LinkedList<T> {
    var head: ListNode<T>?
    
    // Add a new node at the end of the list
    func append(value: T) {
        let newNode = ListNode(value)
        if let lastNode = findLastNode() {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    // Create a linked list from an array
    func fromArray(_ array: [T]) {
        for value in array {
            append(value: value)
        }
    }
    
    // Print the entire linked list
    func printList() {
        var currentNode = head
        while let node = currentNode {
            print(node.val)
            currentNode = node.next
        }
    }
    
    // Helper function to find the last node
    private func findLastNode() -> ListNode<T>? {
        var currentNode = head
        
        while let node = currentNode?.next {
            currentNode = node
        }
        return currentNode
    }
}


let array = [9,9,9,9,9,9,9]
let list1 = LinkedList<Int>()
list1.fromArray(array)
//list1.printList()

let array2 = [9,9,9,9]
let list2 = LinkedList<Int>()
list2.fromArray(array2)


let list = LinkedList<Int>()
list.head = addTwoNumbers(list1.head, l2: list2.head)
list.printList()

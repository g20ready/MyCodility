import UIKit

struct Stack<T> {
    private var internalArray = Array<T>()
    
    mutating func push(_ element: T) {
        self.internalArray.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        guard !self.isEmpty else { return nil }
        return internalArray.remove(at: internalArray.count-1)
    }
    
    var top: T? {
        guard !self.isEmpty else { return nil }
        return internalArray[internalArray.count-1]
    }
    
    var count: Int {
        return internalArray.count
    }
    
    var isEmpty: Bool {
        return internalArray.isEmpty
    }
}

struct Queue<T> {
    private var internalArray = Array<T>()
    
    mutating func enqueue(_ element: T) {
        self.internalArray.insert(element, at: 0)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !self.isEmpty else { return nil }
        return self.internalArray.remove(at: count-1)
    }
    
    var head: T? {
        guard !self.isEmpty else { return nil }
        return self.internalArray[count-1]
    }
    
    var tail: T? {
        guard !self.isEmpty else { return nil }
        return self.internalArray[0]
    }
    
    var count: Int {
        return internalArray.count
    }
    
    var isEmpty: Bool {
        return internalArray.isEmpty
    }
}

struct Fish {
    let weight: Int
    let direction: Int
}

// ¯\_(ツ)_/¯
// 25% performance
public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var queue = Queue<Fish>()
    zip(A, B).forEach { weight, direction in
        queue.enqueue(Fish(weight: weight, direction: direction))
    }
    var stack = Stack<Fish>()
    while !queue.isEmpty {
        // Adding the first fish
        if stack.isEmpty {
            stack.push(queue.dequeue()!)
            continue
        }
        // Same direction
        if queue.head!.direction == stack.top!.direction {
            stack.push(queue.dequeue()!)
            continue
        }
        // If goes upsteam we add it to the stack
        if queue.head!.direction == 1 {
            stack.push(queue.dequeue()!)
            continue
        }
        // Different directions
        if queue.head!.weight > stack.top!.weight {
            stack.pop()
        } else {
            queue.dequeue()
        }
    }
    return stack.count
}

var A = [4, 3, 2, 1, 5]
var B = [0, 1, 0, 0, 0]
solution(&A, &B)

A = [3, 3]
B = [1, 0]
solution(&A, &B)


A = [3, 4, 2, 5]
B = [1, 0, 1, 0]
solution(&A, &B)

import UIKit

struct Stack<T> {
    private(set) var internalArray = Array<T>()
    
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

public func solution(_ H : inout [Int]) -> Int {
    var count = 0
    var stack = Stack<Int>()
    for i in 0..<H.count {
        if stack.isEmpty {
            stack.push(H[i])
            continue
        }
        if H[i] > (stack.top ?? 0) {
            stack.push(H[i])
        } else if H[i] < (stack.top ?? 0) {
            while let top = stack.top, H[i] < top {
                stack.pop()
                count += 1
            }
            if H[i] != stack.top {
                stack.push(H[i])
            }
        }
        print(stack.internalArray)
    }
    return count + stack.count
}

var H = [8, 8, 5, 7, 9, 8, 7, 4, 8]
solution(&H)


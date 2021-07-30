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

struct Wrap {
    let index: Int
    let value: Int
}

public func solution(_ A : inout [Int]) -> Int {
    var stack = Stack<Wrap>()
    for (index, value) in A.enumerated() {
        if stack.isEmpty {
            stack.push(Wrap(index: index, value: value))
            continue
        }
        if stack.top!.value != value {
            stack.pop()
        } else {
            stack.push(Wrap(index: index, value: value))
        }
    }
    if let top = stack.top {
        let count = A.filter { $0 == top.value }.count
        print(A.count / 2)
        if count > A.count / 2 {
            return top.index
        }
    }
    return -1
}

//var A = [3, 1, 3, 2, 3, -1, 3, 3]
//var A = [2, 1, 1, 3, 4]
var A = [2, 1, 1, 1, 3]
solution(&A)

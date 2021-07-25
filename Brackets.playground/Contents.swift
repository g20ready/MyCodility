import UIKit

struct Stack<T> {
    private var internalArray = Array<T>()
    
    mutating func push(_ element: T) {
        self.internalArray.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T {
        return internalArray.remove(at: internalArray.count-1)
    }
    
    var top: T? {
        guard !self.isEmpty else {
            return nil
        }
        return internalArray[internalArray.count-1]
    }
    
    var count: Int {
        return internalArray.count
    }
    
    var isEmpty: Bool {
        return internalArray.isEmpty
    }
    
}

public func solution(_ S : inout String) -> Int {
    if S.isEmpty {
        return 1
    }
    var stack = Stack<String>()
    for c in S {
        print("\(c)")
        switch (stack.top, "\(c)") {
        case ("{", "}"):
            stack.pop()
        case ("(", ")"):
            stack.pop()
        case ("[", "]"):
            stack.pop()
        default:
            stack.push("\(c)")
        }
    }
    return stack.isEmpty ? 1 : 0
}

var S = "{[()()]}"
solution(&S) == 1

S = "([)()]"
solution(&S) == 0


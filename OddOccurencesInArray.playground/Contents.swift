import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    var result = [Int: Int]()
    for number in A {
        if let _ = result[number] {
            result.removeValue(forKey: number)
        } else {
            result[number] = 1
        }
    }
    return result.keys.first!
}

var A = [9, 3, 9, 3, 9, 7, 9]
solution(&A)

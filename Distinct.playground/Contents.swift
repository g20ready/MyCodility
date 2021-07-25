import UIKit

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    var dict = [Int: Bool]()
    for number in A {
        if !(dict[number] ?? false) {
            dict[number] = true
        }
    }
    return dict.count
}

var A = [2, 1, 1, 2, 3, 1]
solution(&A)

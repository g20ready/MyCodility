import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var result = Array<Int>(repeating: 0, count: A.count + 1)
    for number in A {
        result[number-1] = 1
    }
    return result.firstIndex { $0 == 0 }! + 1
}

var A = [2, 3, 1, 5]
solution(&A)

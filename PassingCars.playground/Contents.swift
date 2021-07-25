import UIKit

public func solution(_ A : inout [Int]) -> Int {
    var result = 0
    var multiplier = 0
    for number in A {
        switch number {
        case 0:
            multiplier += 1
        default:
            result += multiplier * 1
        }
        if result > 1_000_000_000 {
            return -1
        }
    }
    return result
}

var A = [0, 1, 0, 1, 1]
solution(&A)

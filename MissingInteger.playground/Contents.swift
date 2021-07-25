import UIKit

public func solution(_ A : inout [Int]) -> Int {
    var missingInteger = 1
    let values = Set(A).sorted()
    for number in values {
        guard number > 0 else { continue }
        if number == missingInteger {
            missingInteger += 1
        }
    }
    return missingInteger
}

var A = [1, 2, 6, 4, 1, 2]
solution(&A)


import UIKit

public func solution(_ A: inout [Int]) -> Int {
    // Instantiate the minimal difference with the first parts
    var part1 = A[0...0].reduce(0) { $0 + $1 }
    var part2 = A[1..<A.count].reduce(0) { $0 + $1 }
    var minimalDifference = abs(part1 - part2)
    for index in 1..<A.count-1 {
        part1 = part1 + A[index]
        part2 = part2 - A[index]
        let difference = abs(part1 - part2)
        if difference < minimalDifference {
            minimalDifference = difference
        }
    }
    return minimalDifference
}

var A = [3, 1, 2, 4, 3]
assert(solution(&A) == 1)

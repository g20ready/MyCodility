import Foundation

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var result = [Int](repeating: 0, count: X)
    var count = 0
    for (index, number) in A.enumerated() {
        if number <= X && result[number-1] == 0 {
            count += 1
            result[number-1] = 1
        }
        if count == X {
            return index
        }
    }
    return -1
}

var A = [1, 3, 1, 4, 2, 3, 5, 4]
let start = CFAbsoluteTimeGetCurrent()
var result = solution(5, &A)
let diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")
assert(result == 6)

// 0.0005129575729370117
// 0.0004659891128540039

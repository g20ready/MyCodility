import UIKit

// increase(X) - counter X is increase by 1
// maxCounter - all counters are set to the maximum value of any counter

// If A[K] = X, such that 1 <= X <= N, then operation K is increase(X)
// if A[K] = N + 1 then operation K is max counter

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var counters = [Int](repeating: 0, count: N)
    var baseline = 0
    var maxCounter = 0
    for number in A {
        if number >= 1 && number <= N {
            if counters[number-1] < baseline {
                counters[number-1] = baseline
            }
            counters[number-1] += 1
            if counters[number-1] > maxCounter {
                maxCounter = counters[number-1]
            }
        } else {
            baseline = maxCounter
        }
    }
    for (index, _) in counters.enumerated() {
        if counters[index] < baseline {
            counters[index] = baseline
        }
    }
    return counters
}

var A = [3, 4, 4, 6, 1, 4, 4]
print(solution(5, &A))

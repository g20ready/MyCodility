import UIKit

// Not Optimal in terms of performance
public func solution(_ A : inout [Int]) -> Int {
    var index = 0
    var minAvg = Double(Int.max)
    var bestSlice = 0...1
    for i in 0..<A.count-1 {
        var currentSum = Double(A[i])
        for j in i+1...A.count-1 {
            print("--> \(j)")
            currentSum += Double(A[j])
            print("---> currentSum is \(currentSum)")
            let average = currentSum / Double(j - i + 1)
            print("---> average is \(average)")
            if average < minAvg {
                bestSlice = i...j
                minAvg = average
                index = i
            }
            if j + 1 < A.count - 1 && Double(A[j+1]) > average {
                break
            }
        }
    }
    print("best slice is \(bestSlice) [\(A[bestSlice])] and average is \(minAvg)")
    return index
}

var a = [4, 2, 2, 5, 1, 5, 8, 1, 2, 1, 8]
solution(&a)

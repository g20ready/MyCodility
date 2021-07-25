import UIKit

// Basic
//public func solution(_ A : inout [Int]) -> Int {
//    if A.count < 3 {
//        return 0
//    }
//    for i in 0..<A.count {
//        for j in i+1..<A.count {
//            for z in j+1..<A.count {
//                if A[i] + A[j] > A[z] && A[j] + A[z] > A[i] && A[z] + A[i] > A[j] {
//                    return 1
//                }
//            }
//        }
//    }
//    return 0
//}

// Advanced
public func solution(_ A : inout [Int]) -> Int {
    if A.count < 3 {
        return 0
    }
    let sortedA = A.sorted()
    for i in (0...sortedA.count-3) {
        let p = sortedA[i]
        let q = sortedA[i+1]
        let r = sortedA[i+2]
        if p + q > r && q + r > p && p + r > q {
            return 1
        }
    }
    return 0
}

var A = [10, 2, 5, 1, 8, 20]
solution(&A) == 1

A = [10, 50, 5, 1]
solution(&A) == 0

A = []
solution(&A) == 0

A = [-2, -2, -2]
solution(&A) == 0

A = [1, 1, 1, 1, 5, 5, 5]
solution(&A)


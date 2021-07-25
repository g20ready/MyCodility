import UIKit

// Basic
//public func solution(_ A : inout [Int]) -> Int {
//    // A[0] = 1 -> 0 = [-1, 1]
//    // A[2] = 2 -> 2 = [0, 4]
//    var intersections = 0
//    for i in 0..<A.count {
//        for j in i+1..<A.count {
//            let a1 = i - A[i]
//            let a2 = i + A[i]
//            let b1 = j - A[j]
//            let b2 = j + A[j]
//            if max(a2, b2) - min(a1, b1) <= (a2 - a1) + (b2 - b1) {
//                intersections += 1
//            }
//        }
//    }
//    return intersections
//}

// Optimized
struct Circle: Comparable {
    let left: Int
    let right: Int
    
    static func < (lhs: Circle, rhs: Circle) -> Bool {
        if lhs.left < rhs.left { return true }
        if rhs.right < rhs.right { return true }
        return false
    }
}

public func solution(_ A : inout [Int]) -> Int {
    let circles = A.enumerated().map { index, radius in
        return Circle(left: index-radius, right: index+radius)
    }.sorted()
    var intersections = 0
    for i in 0..<circles.count {
        for j in i+1..<circles.count {
            if circles[i].right >= circles[j].left {
                intersections += 1
                if intersections > 10_000_000 {
                    return -1
                }
            } else {
                break
            }
        }
    }
    return intersections
}

var A = [1, 5, 2, 1, 4, 0]
solution(&A)

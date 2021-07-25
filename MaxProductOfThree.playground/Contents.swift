import UIKit

public func solution(_ A : inout [Int]) -> Int {
    let sortedA = A.sorted()
    let length = A.count
    // 3 last : [-3, -2, -1, ... , 5, 6, 7]
    let product1 = sortedA[length-3..<length].reduce(1) { $0 * $1 }
    // 3 first : [-6, -7, 8, 9]
    let product2 = sortedA[0...2].reduce(1) { $0 * $1 }
    // 2 first with last : [-6, -5 ... , 7]
    let product3 = sortedA[0...1].reduce(1) { $0 * $1 } * sortedA[length-1]
    // first with 2 last : [-100, .., -1, 10]
    let product4 = sortedA[0] * sortedA[length-2..<length].reduce(1) { $0 * $1 }
    
    return max(max(product1, product2), max(product3, product4))
}

var A = [-3, 1, 2, -2, 5, 6]
//var A = [-3, 1, 2]
solution(&A)

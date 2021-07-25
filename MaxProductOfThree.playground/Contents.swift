import UIKit

public func solution(_ A : inout [Int]) -> Int {
    var maxProduct = Int.min
    var triplet = ""
    for i in 0..<A.count {
        
        for j in i+1..<A.count {
            
            for z in j+1..<A.count {
                let product = A[i] * A[j] * A[z]
                if product > maxProduct {
                    maxProduct = product
                    triplet = "\(i) - \(j) - \(z)"
                }
            }
        }
    }
    print(triplet)
    return maxProduct
}

var A = [3, -1, -2, 2, -3, -2]
solution(&A)

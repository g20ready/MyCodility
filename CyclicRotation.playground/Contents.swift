import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    var result = [Int]()
    let Alength = A.count
    guard Alength > 0 else {
        return A
    }
    let k = K % Alength
    guard k > 0 else {
        return A
    }
    for i in (1...k).reversed() {
        result.append(A[Alength - i])
    }
    for i in (0..<Alength-k) {
        result.append(A[i])
    }
    return result
}

var A = [Int]()
solution(&A, 13)

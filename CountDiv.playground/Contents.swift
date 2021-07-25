import UIKit

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    var counter = 0
    var base: Int? = nil
    for i in A...B {
        if i % K == 0 {
            counter += 1
            base = i
            break
        }
    }
    if let base = base {
        print(base)
        return counter + (B - base) / K
    }
    return counter
}

solution(7, 25, 12)

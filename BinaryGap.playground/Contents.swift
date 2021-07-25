import Foundation

public func solution(_ N : Int) -> Int {
    let binary = String(N, radix: 2)
    var stacks = [Int]()
    var stack = 0
    for c in binary {
        if c == "1" {
            if stack > 0 {
                stacks.append(stack)
            }
            stack = 0
        } else {
            if stack >= 0 {
                stack += 1
            }
        }
    }
    return stacks.sorted().last ?? 0
}

solution(1041)

solution(32)


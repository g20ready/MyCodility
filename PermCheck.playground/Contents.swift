import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var permutated = [Int:Bool]()
    var maxNumber = 0
    for number in A {
        if permutated[number] ?? false {
           return 0
        }
        permutated[number] = true
        if number > maxNumber {
            maxNumber = number
        }
    }
    return maxNumber == A.count ? 1 : 0
}

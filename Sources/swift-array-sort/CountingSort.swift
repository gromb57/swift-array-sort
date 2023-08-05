//
//  CountingSort.swift
//  
//
//  Created by Jerome Bach on 04/08/2023.
//

import Foundation

extension Array where Element == Int {
    mutating func countingSort() -> Self {
        let n: Int = self.count
        let k: Int = self.max() ?? 0
        var c: [Int] = Array(repeating: 0, count: k + 1)
        let t: [Int] = self
        var s: [Int] = self
        
        // fill c
        // c[i] = number of times i appears in t
        for i in 0..<n {
            c[t[i]] = c[t[i]] + 1
        }
        // update c
        // c[i] = number of times where an element <= i appears in t
        for i in 1..<k+1 {
            c[i] = c[i] + c[i-1]
        }
        // fill s with ordered number sort in ascending way
        for i in stride(from: n-1, through: 0, by: -1) {
            var index: Int = c[t[i]] - 1
            if index == -1 {
                index = s.count - 1
            }
            s[index] = t[i]
            c[t[i]] = c[t[i]] - 1
        }
        
        self = s
        return self
    }
}

//
//  BubbleSort.swift
//  
//
//  Created by Jerome Bach on 03/08/2023.
//

import Foundation

extension Array where Element: Comparable {
    mutating func bubbleSort() -> Self {
        var i: Int = 0
        let n: Int = self.count
        let upper: Int = n - 1
        
        while i <= upper {
            let lower: Int = i + 1
            for j in stride(from: upper, through: lower, by: -1) {
                if self[j] < self[j-1] {
                    self.swapAt(j-1, j)
                }
            }
            i += 1
        }
        return self
    }
}

//
//  SelectionSort.swift
//  
//
//  Created by Jerome Bach on 03/08/2023.
//

import Foundation

extension Array where Element: Comparable {
    @discardableResult
    mutating func selectionSort() -> Self {
        var i: Int = 0
        var j: Int
        let n: Int = self.count
        let upper: Int = n
        
        while i < upper {
            j = i
            let lower: Int = i + 1
            for k in lower..<upper {
                if self[k] < self[j] {
                    j = k
                }
            }
            self.swapAt(j, i)
            i += 1
        }
        return self
    }
}

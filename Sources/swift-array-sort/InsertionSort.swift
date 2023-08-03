//
//  InsertionSort.swift
//  
//
//  Created by Jerome Bach on 03/08/2023.
//

import Foundation

extension Array where Element: Comparable {
    mutating func insertionSort() -> Self {
        let n: Int = self.count
        let upper: Int = n
        let lower: Int = 1
        
        for i in lower..<upper {
            var k: Int = i - 1
            let x: Element = self[i]
            var b: Bool = self[k] > x
            
            while b {
                self[k+1] = self[k]
                k -= 1
                if k > -1 {
                    b = self[k] > x
                } else {
                    b = false
                }
            }
            self[k+1] = x
        }
        return self
    }
}

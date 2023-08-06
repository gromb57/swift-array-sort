//
//  QuickSort.swift
//  
//
//  Created by Jerome Bach on 03/08/2023.
//

import Foundation

extension Array where Element: Comparable {
    @discardableResult
    mutating func quickSort() -> Self {
        rapide(0, self.count - 1)
        return self
    }

    private mutating func rapide(_ i: Int, _ j: Int) {
        if i < j {
            let aux: Int = partitionner(i, j)
            rapide(i, aux - 1)
            rapide(aux + 1, j)
        }
    }
    
    private mutating func partitionner(_ i: Int, _ j: Int) -> Int {
        let x: Element = self[i]
        var l: Int = i + 1
        var m: Int = j
        var b: Bool = true
        
        while b {
            while self[m] > x {
                m -= 1
            }
            var bb: Bool = self[l] <= x
            while bb {
                l += 1
                if l <= j {
                    bb = self[l] <= x
                } else {
                    bb = false
                }
            }
            if l < m {
                self.swapAt(l, m)
            } else {
                b = false
            }
        }
        
        self.swapAt(i, m)
        return m
    }
}

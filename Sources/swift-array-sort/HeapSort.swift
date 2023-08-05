//
//  HeapSort.swift
//  
//
//  Created by Jerome Bach on 05/08/2023.
//

import Foundation

extension Array where Element == Int {
    @discardableResult
    mutating func heapSort() -> Self {
        let n: Int = self.count
        var p: Int = 0
        var min: Int
        var tab: Self = self
        
        while p < n {
            self.add(x: tab[p], p: &p, tab:&tab)
        }
        while p > 1 {
            min = self.deleteMin(p: &p, tab: &tab)
            tab[p] = min
        }
        
        return self
    }

    fileprivate func add(x: Int, p: inout Int, tab: inout [Int]) {
        p += 1
        tab[p-1] = x
        var i: Int = p
        var b: Bool = i > 1
        var aux: Int
        
        if b {
            b = tab[i-1] < tab[i/2 - 1]
        }
        while b {
            aux = tab[i - 1]
            tab[i - 1] = tab[i/2 - 1]
            tab[i/2 - 1] = aux
            i = i/2
            b = i > 1
            if b {
                b = tab[i-1] < tab[i/2 - 1]
            }
        }
    }
    
    fileprivate func deleteMin(p: inout Int, tab: inout [Int]) -> Int {
        let min: Int = tab[0]
        tab[0] = tab[p-1]
        p = p - 1
        var i: Int = 1
        var j: Int
        
        while i <= p/2 {
            if (2*i == p) || (tab[2*i-1] < tab[2*i]) {
                j = 2 * i
            } else {
                j = 2 * i + 1
            }
            if tab[i-1] > tab[j-1] {
                tab.swapAt(i - 1, j - 1)
                i = j
            } else {
                return min
            }
        }
        return min
    }
}

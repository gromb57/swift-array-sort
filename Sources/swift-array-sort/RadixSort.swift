//
//  RadixSort.swift
//  
//
//  Created by Jerome Bach on 05/08/2023.
//

import Foundation

extension Int {
    var countOfDigits: Int {
       // Store the total count
       var count = 0
       // Store the number
       var num = self

       // Checking the number for 0
       // If yes print 1
       if num == 0 {
          return 1
       }
     
       // Check for the positive number
       while num > 0 {
          // Divide the num by 10 and store
          // the quotient into the num variable
          num = num / 10
          // If the quotient is not zero, then update the
          // count by one. If the quotient is zero,
          // then stop the count
          count += 1
       }

       // Return the final count
       return count
    }
}

extension Array where Element == Int {
    @discardableResult
    mutating func bucketSort(_ digits: Int, _ base: Int = 10) -> Self {
        var exp: Int = digits
        var done = false
        while !done {
            done = true
            // init buckets
            var buckets: [[Int]] = .init(repeating: [], count: base)
            // place number in the correct bucket
            forEach {
                number in
                let remainingPart = number / exp
                let digit = remainingPart % base
                buckets[digit].append(number)
                
                if remainingPart > 0 {
                  done = false
                }
            }
            //
            exp *= base
            self = buckets.flatMap { $0 }
        }
        return self
    }
    
    mutating func radixSort() -> Self {
        let base: Int = 10
        let maxDigits: Int = (self.max() ?? 0).countOfDigits
        
        for _ in 0..<maxDigits {
            self.bucketSort(maxDigits, base)
        }
        
        return self
    }
}

//
//  Shuffle.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

/*extension MutableCollection where Index == Int {
 mutating func shuffleInPlace() {
 // empty and single-element collections don't shuffle
 if count < 2 { return }
 for i in startIndex ..< endIndex - 1 {
 let j = Int(arc4random_uniform(UInt32(count - i))) + i
 guard i != j else { continue }
 swap(&self[i], &self[j])
 }
 }
 }*/

extension MutableCollection where Indices.Iterator.Element == Index {
    // Shuffles the contents of this collection.
    mutating func shuffleInPlace() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

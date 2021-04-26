//
//  main.swift
//  ThreadSafeArray
//
//  Created by Никита Гусев on 26.04.2021.
//

import Foundation

let threadSafeArray = ThreadSafeArray<Int>()
let globalQueue = DispatchQueue.global(qos: .utility)
let dispatchGroup = DispatchGroup()
let maxIteration = 1000

for _ in 0...1 {
    dispatchGroup.enter()
    globalQueue.async() {
        for number in 0...maxIteration {
            threadSafeArray.append(number) {
                if number == maxIteration {
                    dispatchGroup.leave()
                }
            }
        }
    }
}

dispatchGroup.wait()
print(threadSafeArray.count)

//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Никита Гусев on 26.04.2021.
//

import Foundation

class ThreadSafeArray<T: Equatable> {
    private var array = [T]()
    private let queue = DispatchQueue(label: "com.threadsafearray.queue", attributes: .concurrent)
    
    var count: Int {
        self.queue.sync { [weak self] in
            guard let self = self else {
                return 0
            }
            return self.array.count
        }
    }
    
    var isEmpty: Bool {
        self.queue.sync { [weak self] in
            guard let self = self else {
                return true
            }
            return self.array.isEmpty
        }
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) { [weak self] in
            guard let self = self else {
                return
            }
            self.array.append(item)
        }
    }
    
    func append(_ item: T, completion: @escaping () -> ()) {
        self.queue.async(flags: .barrier) { [weak self] in
            guard let self = self else {
                return
            }
            self.array.append(item)
            completion()
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) { [weak self] in
            guard let self = self, (0..<self.array.count).contains(index) else {
                return
            }
            self.array.remove(at: index)
        }
    }
    
    func remove(at index: Int, completion: @escaping () -> ()) {
        self.queue.async(flags: .barrier) { [weak self] in
            guard let self = self, (0..<self.array.count).contains(index) else {
                return
            }
            self.array.remove(at: index)
            completion()
        }
    }
    
    subscript(index: Int) -> T? {
        self.queue.sync { [weak self] in
            guard let self = self, (0..<self.array.count).contains(index) else {
                return nil
            }
            return self.array[index]
        }
    }
    
    func contains(_ element: T) -> Bool {
        self.queue.sync { [weak self] in
            guard let self = self else {
                return false
            }
            return self.array.contains(element)
        }
    }
}

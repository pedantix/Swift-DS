//
//  Heap.swift
//  
//
//  Created by shaun on 2/9/22.
//

import Foundation


public struct Heap<Element: Comparable> {
    public enum Config {
        case min, max
    }

    /// The config of the heap
    private var config: Config

    /// The underlying datastructure to maintain a complete binary tree
    internal var heapArr: [Element] = []


    /**
     Initialize a heap with optional size reservation and configuration
     - Author:
     Shaun Hubbard

     - returns:
     A Heap

     - parameters:
        - size: (optional) make a reservation of N size for the Heap
        - config: configure the heap as min or max, defaults to min

     - Important:
     This is untested
     */
    public init(size: Int? = nil, config: Config = .min) {
        self.config = config

        if let size = size {
            heapArr.reserveCapacity(size)
        }
    }

    /// Inserts an element into the priority queue
    public mutating func add(_ element: Element) {
        var index = heapArr.count
        heapArr.append(element)
        // Heapify Up
        while index > 0 {
            let parentIdx = parentIndex(of: index)
            if !validate(child: index, parent: parentIdx) {
                heapArr.swapAt(index, parentIdx)
                index = parentIdx
            } else {
                break
            }
        }

    }

    /// Peeks at top element of the heap
    public func peek() -> Element? {
        return heapArr.first
    }

    /// Delete element off the top of the heap
    public mutating func pop() -> Element? {
        guard let firstElement = heapArr.first else { return nil }
        guard let lastElement = heapArr.popLast(), !heapArr.isEmpty else { return firstElement }
        heapArr[0] = lastElement

        // Heapify down
        var index = 0
        while !isLeaf(idx: index) {
            let rightIdx = rightIndex(of: index)
            let leftIdx = leftIndex(of: index)

            if rightIdx < heapArr.count {
                let childIndex: Int
                switch config {
                case .min:
                    childIndex = heapArr[leftIdx] < heapArr[rightIdx] ? leftIdx : rightIdx
                case .max:
                    childIndex = heapArr[leftIdx] > heapArr[rightIdx] ? leftIdx : rightIdx
                }

                if !validate(child: childIndex, parent: index) {
                    heapArr.swapAt(childIndex, index)
                    index = childIndex
                } else {
                    break
                }
            } else {
                if !validate(child: leftIdx, parent: index) {
                    heapArr.swapAt(leftIdx, index)
                }
                break
            }
        }

        return firstElement
    }



    /// Compare elements for heapificiation
    private func validate(child idx1: Int, parent idx2: Int) -> Bool {
        guard idx1 < heapArr.count else { return true }
        switch config {
        case .min:
            return heapArr[idx2] < heapArr[idx1]
        case .max:
            return heapArr[idx2] > heapArr[idx1]
        }
    }

    /// Size of Heap
    public var count: Int {
        return heapArr.count
    }
}

// MARK: - Index Helper Functions
extension Heap {
    private func parentIndex(of idx: Int) -> Int {
        return (idx - 1) / 2
    }

    private func leftIndex(of idx: Int) -> Int {
        return (idx * 2) + 1
    }

    private func rightIndex(of idx: Int) -> Int {
        return leftIndex(of: idx) + 1
    }

    private func isLeaf(idx: Int) -> Bool {
        return leftIndex(of: idx) >= heapArr.count
    }
}

//
//  Queue.swift
//  
//
//  Created by shaun on 3/30/22.
//

import Foundation

public struct Queue<Element> {
    internal var array = [Element]()

    public init() { /* noop */ }

    public mutating func enqueue(_ ele: Element?) {
        guard let ele = ele else { return }
        array.append(ele)
    }

    public mutating func deque() -> Element? {
        guard let element = array.first else { return nil }
        array.remove(at: 0)
        return element
    }

    public func poll() -> Element? {
        return array.first
    }
}

//
//  Stack.swift
//  
//
//  Created by shaun on 3/18/22.
//

import Foundation

public struct Stack<Element> {
    private var arr = [Element]()

    public init() { /* noop */ }

    public mutating func push(_ ele: Element) {
        arr.append(ele)
    }

    public mutating func push(_ ele: Element?) {
        guard let ele = ele else {
            return
        }
        push(ele)
    }

    public func peek() -> Element? {
        return arr.last
    }

    @discardableResult
    public mutating func pop() -> Element? {
        return arr.popLast()
    }

    public var count: Int {
        return arr.count
    }

    public var isEmpty: Bool {
        return arr.isEmpty
    }
}

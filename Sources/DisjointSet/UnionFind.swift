//
//  UnionFind.swift
//  
//
//  Created by shaun on 3/4/22.
//

import Foundation

public struct UnionFind<Element: Hashable> {
    private var graph = [Element: Element]()
    private var rank = [Element: Int]()

    public init() { }

    // Returns the element parent graph
    public mutating func find(_ element: Element) -> Element {
        var ele = element
        if graph[ele] == nil {
            graph[ele] = ele
            rank[ele] = 1
        }
        while ele != graph[ele] {
            graph[ele] = find(graph[ele]!)
            ele = graph[ele]!
        }
        return graph[ele]!
    }

    public mutating func unionSet(elementX: Element, elementY: Element) {
        let rootX = find(elementX), rootY = find(elementY)
        if rootX != rootY {
            if rank[rootX]! > rank[rootY]! {
                graph[rootY] = rootX
            } else if rank[rootX]! < rank[rootY]! {
                graph[rootX] = rootY
            } else {
                graph[rootY] = rootX
                rank[rootX] = 1 + rank[rootX]!
            }
        }
    }

    public mutating func connected(elementX: Element, elementY: Element) -> Bool {
        return find(elementX) == find(elementY)
    }
}

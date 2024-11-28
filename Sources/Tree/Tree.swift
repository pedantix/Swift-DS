//
//  Tree.swift
//  DSAlg
//
//  Created by Shaun Hubbard on 11/24/24.
//


public protocol Tree {
    associatedtype Element: Comparable

    mutating func insert(_ element: Element)

    mutating func remove(_ element: Element) -> Element?

    func search(_ element: Element) -> Element?

    func contains(_ element: Element) -> Bool

    mutating func clear()

    var isEmpty: Bool { get }

    var min: Element?  { get }

    var max: Element?  { get }

    var inorder: [Element] { get }
}

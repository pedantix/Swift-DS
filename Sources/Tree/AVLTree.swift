//
//  AVLTree.swift
//  DSAlg
//
//  Created by Shaun Hubbard on 11/24/24.
//

import Foundation


// Note not thread safe, a thread safe version could be masde but would require alot of copying cost.
// build it if it becomes relevent
public struct AVLTree<Element: Comparable> {
    private var node: Node?

    public init () {

    }

    fileprivate final class Node {
        var value: Element
        var left: Node?
        var right: Node?
        var height: Int

        init(value: Element, left: Node? = nil, right: Node? = nil, height: Int = 1) {
            self.value = value
            self.height = height
            self.left = left
            self.right = right
        }

        var description: String {
            var result: String = ""
            var generations = 0

            var nodeQueues = [[self]]

            while let nodes = nodeQueues.first {
                nodeQueues.removeFirst()
                generations += 1
                var nextGeneration: [Node] = []

                result = result + "gen\(generations):["

                for node in nodes {
                    result += "\(node.value),"
                    nextGeneration.append(contentsOf: [node.left, node.right].compactMap(\.self))
                }

                result += "]\n"

                if !nextGeneration.isEmpty {
                    nodeQueues.append(nextGeneration)
                }
            }


            return result

        }
    }
}


// MARK: - Tree Interface
extension AVLTree: Tree {
    public mutating func insert(_ element: Element) {
        if node == nil {
            node = .init(value: element)
        } else {
            node = node?.insert(element)
        }
    }
    
    public mutating func remove(_ element: Element) -> Element? {
        guard node != nil else { return nil }
        let temp = search(element)
        node = delete(from: node, value: element)
        return temp
    }
    
    public func search(_ element: Element) -> Element? {
        return node?.search(element)?.value
    }
    
    public func contains(_ element: Element) -> Bool {
        return node?.search(element) != nil
    }

    public mutating func clear() {
        node = nil
    }

    public var min: Element? {
        return node?.minNode?.value
    }

    public var max: Element? {
        return node?.maxNode?.value
    }

    public var isEmpty: Bool {
        return node == nil
    }

    public var inorder: [Element] {
        return node?.inorder ?? []
    }
}


// MARK: - Balancing Funcs
extension AVLTree.Node {
    var balanceFactor: Int {
        (self.left?.height ?? 0) - (self.right?.height ?? 0)
    }

    func rightRotate() -> AVLTree.Node? {
        guard let startLeft = self.left else { return self }
        let startLeftsRight = startLeft.right

        // perform rotation
        startLeft.right = self
        self.left = startLeftsRight

        // update heights
        height = max(left?.height ?? 0, right?.height ?? 0) + 1
        startLeft.height = max(startLeft.left?.height ?? 0, startLeft.right?.height ?? 0 ) + 1

        return startLeft
    }

    func leftRotate() -> AVLTree.Node? {
        guard let startRight = self.right else { return self }
        let startRightsLeft = startRight.left

        // rotate
        startRight.left = self
        self.right = startRightsLeft

        // update heights

        height = max(left?.height ?? 0, right?.height ?? 0) + 1
        startRight.height = max(startRight.left?.height ?? 0, startRight.right?.height ?? 0 ) + 1

        return startRight
    }

    func insert(_ key: Element) -> AVLTree.Node? {
        if key < value {
            left = left?.insert(key) ?? AVLTree.Node(value:key)
        } else if key > value {
            right = right?.insert(key) ?? AVLTree.Node(value:key)
        } else {
            self.value = key
            return self
        }

        // update height
        height = max(left?.height ?? 0, right?.height ?? 0) + 1

        let balance = balanceFactor

        // Left Left Case  > 1
        if let left, balance > 1 && value < left.value  {
            return rightRotate()
        }

        // Right Right Case
        if let right, balance < -1 && value > right.value {
            return leftRotate()
        }

        // Left Right Case
        if let left, balance > 1 && value > left.value {
            self.left = left.leftRotate()
            return rightRotate()
        }

        // Right Left Case
        if let right, balance < -1 && value < right.value {
            self.right = right.rightRotate()
            return leftRotate()
        }

        return self
    }

    var minNode: AVLTree.Node? {
        return left?.minNode ?? self
    }

    var maxNode: AVLTree.Node? {
        return right?.maxNode ?? self
    }

    func search(_ element: Element) -> AVLTree.Node? {
        guard element != self.value else { return self }

        if element < value {
            return left?.search(element)
        } else {
            return right?.search(element)
        }
    }

    var inorder: [Element] {
        return (left?.inorder ?? []) + [value] + (right?.inorder ?? [])
    }
}


extension AVLTree {
    private func delete(from root: AVLTree.Node?, value: Element) -> AVLTree.Node? {
        var root: AVLTree.Node? = root
        guard root != nil else { return nil }

        if value < root!.value {
            root?.left = delete(from: root?.left, value: value)
        } else if value > root!.value {
            root?.right = delete(from: root?.right, value: value)
        } else {
            if root?.left == nil || root?.right == nil {
                guard let temp = root?.left ?? root?.right else { return nil }
                root = temp
            } else {
                guard let min = root?.right?.minNode else { return nil }
                root?.value = min.value
                root?.right = delete(from: root?.right, value: min.value)
            }
        }

        // this may be off
        guard let root else { return nil }

        root.height = Swift.max(root.left?.height ?? 0, root.right?.height ?? 0) + 1

        let balance = root.balanceFactor

        // Left Left Case
        if balance > 1 && root.left?.balanceFactor ?? 0 >= 0 {
            return root.rightRotate()
        }

        // Left Right Case
        if balance > 1 && root.left?.balanceFactor ?? 0 < 0 {
            root.left = root.left?.leftRotate()
            return root.leftRotate()
        }

        // Right Right case
        if balance < -1 && root.right?.balanceFactor ?? 0 <= 0 {
            return root.leftRotate()
        }

        // Right Left case
        if balance < -1 && root.right?.balanceFactor ?? 0 > 0 {
            root.right = root.right?.rightRotate()
            return root.leftRotate()
        }
        return root
    }
}

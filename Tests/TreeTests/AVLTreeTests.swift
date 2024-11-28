//
//  AVLTree.swift
//  DSAlg
//
//  Created by Shaun Hubbard on 11/24/24.
//

import XCTest
import Tree

class AVLTreeTests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
// MARK: - test empty case

    func testEmptyTree() throws {
        let tree = AVLTree<Int>()
        XCTAssertTrue(tree.isEmpty)
        XCTAssertNil(tree.max)
        XCTAssertNil(tree.min)
    }



    func testSmallTree()  {

        var avlTree = AVLTree<Int>()

        avlTree.insert(1)
        avlTree.insert(2)
        avlTree.insert(3)
        avlTree.insert(4)
        avlTree.insert(5)
        avlTree.insert(6)
        avlTree.insert(7)
        avlTree.insert(8)
        avlTree.insert(9)
        avlTree.insert(10)
        avlTree.insert(11)

        XCTAssertEqual(avlTree.min, 1)
        XCTAssertEqual(avlTree.max, 11)

        XCTAssertEqual([1,2,3,4,5,6,7,8,9,10,11], avlTree.inorder)
    }


// MARK: - test random data

    private func createPopulatedTree() -> AVLTree<Int> {
        var tree = AVLTree<Int>()
        for val in data {
            tree.insert(val)
        }
        return tree
    }

    private func createUniquePopulatedTree() -> AVLTree<Int> {
        var tree = AVLTree<Int>()
        for val in uniqueData {
            tree.insert(val)
        }
        return tree
    }


    func testNonUniqueData() throws {
        var testTree = createPopulatedTree()

        XCTAssertEqual(dataInOrder, testTree.inorder)

        XCTAssertEqual(dataInOrder.first, testTree.min)
        XCTAssertEqual(dataInOrder.last, testTree.max)
        XCTAssertFalse(testTree.isEmpty)

        for val in dataInOrder {
            XCTAssertEqual(val, testTree.search(val))
            XCTAssertTrue(testTree.contains(val))
            XCTAssertEqual(val, testTree.remove(val))
            XCTAssertNil(testTree.remove(val))
            XCTAssertFalse(testTree.contains(val))
        }

        XCTAssertTrue(testTree.isEmpty)
    }

    func testUniqueData() throws {
        var testTree = createUniquePopulatedTree()

        XCTAssertEqual(uniqueDataInOrder, testTree.inorder)
        XCTAssertEqual(uniqueDataInOrder.first, testTree.min)
        XCTAssertEqual(uniqueDataInOrder.last, testTree.max)
        XCTAssertFalse(testTree.isEmpty)

        for val in uniqueDataInOrder {
            XCTAssertEqual(val, testTree.search(val))
            XCTAssertTrue(testTree.contains(val))
            XCTAssertEqual(val, testTree.remove(val))
            XCTAssertNil(testTree.remove(val))
            XCTAssertFalse(testTree.contains(val))
        }

        XCTAssertTrue(testTree.isEmpty)
    }
}

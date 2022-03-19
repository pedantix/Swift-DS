//
//  QuickFindTests.swift
//
//
//  Created by shaun on 3/4/22.
//

import XCTest
import DisjointSet

final class UnionFindTests: XCTestCase {
    func testExample() throws {
        var qf = UnionFind<Int>()

        qf.unionSet(elementX: 1, elementY: 2)
        qf.unionSet(elementX: 2, elementY: 5)
        qf.unionSet(elementX: 5, elementY: 6)
        qf.unionSet(elementX: 6, elementY: 7)
        qf.unionSet(elementX: 3, elementY: 8)
        qf.unionSet(elementX: 8, elementY: 9)

        XCTAssertTrue(qf.connected(elementX: 1, elementY: 5))
        XCTAssertTrue(qf.connected(elementX: 5, elementY: 7))
        XCTAssertFalse(qf.connected(elementX: 4, elementY: 9))
        qf.unionSet(elementX: 9, elementY: 4)
        XCTAssertTrue(qf.connected(elementX: 4, elementY: 9))
    }
}

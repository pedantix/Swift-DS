//
//  HeapTest.swift
//  
//
//  Created by shaun on 2/9/22.
//

import Foundation
import Heap
import XCTest

final class HeapTests: XCTestCase {
    func testBasicHeap_Min() throws {
        var heap = Heap<Int>()

        heap.add(5)
        XCTAssertEqual(heap.description, "[5]")
        heap.add(6)
        XCTAssertEqual(heap.description, "[5, 6]")
        heap.add(3)
        XCTAssertEqual(heap.description, "[3, 6, 5]")
        heap.add(1)
        XCTAssertEqual(heap.description, "[1, 3, 5, 6]")
        heap.add(2)
        XCTAssertEqual(heap.description, "[1, 2, 5, 6, 3]")


        XCTAssertEqual(heap.peek(), 1)

        XCTAssertEqual(heap.pop(), 1)

        XCTAssertEqual(heap.pop(), 2)
        XCTAssertEqual(heap.pop(), 3)

        XCTAssertEqual(heap.description, "[5, 6]")
    }

    func testBasicHeap_Max() {
        var heap = Heap<Int>(config: .max)
        heap.add(5)
        XCTAssertEqual(heap.description, "[5]")
        heap.add(6)
        XCTAssertEqual(heap.description, "[6, 5]")
        heap.add(3)
        XCTAssertEqual(heap.description, "[6, 5, 3]")
        heap.add(1)
        XCTAssertEqual(heap.description, "[6, 5, 3, 1]")
        heap.add(2)
        XCTAssertEqual(heap.description, "[6, 5, 3, 1, 2]")


        XCTAssertEqual(heap.peek(), 6)

        XCTAssertEqual(heap.pop(), 6)

        XCTAssertEqual(heap.pop(), 5)
        XCTAssertEqual(heap.pop(), 3)

        XCTAssertEqual(heap.description, "[2, 1]")
    }
}

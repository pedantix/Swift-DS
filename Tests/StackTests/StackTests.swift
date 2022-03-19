//
//  StackTests.swift
//  
//
//  Created by shaun on 3/18/22.
//

import XCTest
import Stack

class StackTests: XCTestCase {
    func testStack() throws {
        var stack = Stack<Int>()

        XCTAssert(stack.isEmpty)
        stack.push(1)
        XCTAssertFalse(stack.isEmpty)
        stack.pop()
        XCTAssert(stack.isEmpty)

        stack.push(1)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)

        stack.push(1)
        stack.push(2)
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)
    }

    func testStackIsExpressibleByArrayLiteral() {
        var stack: Stack<Int> = [3, 2, 1]

        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)

        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.peek(), 3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.peek(), nil)
        XCTAssertEqual(stack.pop(), nil)
    }
}

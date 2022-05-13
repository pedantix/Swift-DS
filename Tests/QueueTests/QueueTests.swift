//
//  QueueTests.swift
//  
//
//  Created by shaun on 3/30/22.
//

import Foundation
import Queue
import XCTest

final class QueueTests: XCTestCase {
    func testIsFifo() throws {
        var queue = Queue<String>()
        queue.enqueue("one")
        queue.enqueue("two")
        queue.enqueue("three")

        XCTAssertEqual(queue.poll(), "one")
        XCTAssertEqual(queue.deque(), "one")

        XCTAssertEqual(queue.poll(), "two")
        XCTAssertEqual(queue.deque(), "two")

        XCTAssertEqual(queue.poll(), "three")
        XCTAssertEqual(queue.deque(), "three")
    }

    func testIsExpressibleByArrayLiteral() {
        var queue: Queue<String> = ["one", "two", "three"]
        XCTAssertEqual(queue.poll(), "one")
        XCTAssertEqual(queue.deque(), "one")

        XCTAssertEqual(queue.poll(), "two")
        XCTAssertEqual(queue.deque(), "two")

        XCTAssertEqual(queue.poll(), "three")
        XCTAssertEqual(queue.deque(), "three")
    }
}

//
//  Queue+ExpressibleByArrayLiteral.swift
//  
//
//  Created by shaun on 4/1/22.
//

import Foundation

extension Queue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        array = elements
    }

    public typealias ArrayLiteralElement = Element
}

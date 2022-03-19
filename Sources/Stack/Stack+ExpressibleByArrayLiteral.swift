//
//  Stack+ExpressibleByArrayLiteral.swift
//  
//
//  Created by shaun on 3/18/22.
//

import Foundation

extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element

    public init(arrayLiteral elements: Element...) {
        for each in elements {
            push(each)
        }
    }
}

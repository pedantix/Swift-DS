//
//  Heap+CustomStringConvertible.swift
//  
//
//  Created by shaun on 2/9/22.
//

import Foundation

extension Heap: CustomStringConvertible {
    public var description: String {
        return "\(heapArr)"
    }
}

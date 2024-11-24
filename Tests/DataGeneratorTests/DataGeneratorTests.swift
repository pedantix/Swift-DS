//
//  DataGeneratorTests.swift
//  DSAlg
//
//  Created by Shaun Hubbard on 11/24/24.
//


import XCTest
@testable import DataGenerator

final class DataGeneratorTests: XCTestCase {
    func testGenerateSomeData() throws {
        let data = DataGenerator().generate()

        XCTAssertEqual(10_000, data.count)
        XCTAssertTrue(Set(data).count != 1, "this is a test that data is 'random', its naive and not good")
    }

    func testGenerateSomeUniqueData() throws {
        let data = DataGenerator().generate()

        XCTAssertEqual(10_000, data.count)
        XCTAssertTrue(Set(data).count == 10_000, "this tests for uniqueness \(Set(data).count) should be 10_000")
    }


    func testPrintUsefulDataSetToStdout() throws {
        let dataGenerator = DataGenerator()

        let data = dataGenerator.generate()
        let uniqueData = dataGenerator.generate()

        let orderedData = data.sorted()
        let uniqueOrderedData = uniqueData.sorted()


        let dataString = """
        let data = [\(data.map({"\($0)"}).joined(separator: ","))]
        
        let dataInOrder = [\(orderedData.map({"\($0)"}).joined(separator: ","))]
        
        let uniqueData = [\(uniqueData.map({"\($0)"}).joined(separator: ","))]
        
        let uniqueDataInOrder = [\(uniqueOrderedData.map({"\($0)"}).joined(separator: ","))]
        """


        print(dataString)


    }
}

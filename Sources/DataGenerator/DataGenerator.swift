//
//  DataGenerator.swift
//  DSAlg
//
//  Created by Shaun Hubbard on 11/24/24.
//

public struct DataGenerator {
    let count: Int
    let unique: Bool

    init(count: Int = 10_000, unique: Bool = false) {
        self.count = count
        self.unique = unique
    }


    public func generate() -> [Int] {
        if unique {
            return generateUniqueData()
        } else {
            return generateNoisyData()
        }
    }


    private func generateNoisyData() -> [Int] {
        var newData = [Int]()

        while (newData.count < count) {
            let randomInt = randomInteger()
            newData.append(randomInt)
        }


        return newData
    }

    private func generateUniqueData() -> [Int] {
        var newData = Set<Int>()

        while (newData.count < count) {
            let randomInt = randomInteger()
            newData.insert(randomInt)
        }

        return newData.map(\.self)
    }

    private func randomInteger() -> Int {
        return Int.random(in: Int.min...Int.max)
    }
}

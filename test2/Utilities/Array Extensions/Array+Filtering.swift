//
//  Array+Filtering.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import Foundation

public extension Array where Element: Hashable {
    static func removeDuplicates(_ elements: [Element]) -> [Element] {
        var seen = Set<Element>()
        return elements.filter{ seen.insert($0).inserted }
    }
}

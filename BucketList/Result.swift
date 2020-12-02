//
//  Result.swift
//  BucketList
//
//  Created by Rafael Calunga on 2020-12-01.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}

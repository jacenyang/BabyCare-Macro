//
//  SensorData.swift
//  APITest
//
//  Created by Jason Yang on 12/11/20.
//

import Foundation

struct SensorData: Codable {
    let feeds: [Feeds]
}

struct Feeds: Codable {
    let created_at: String
    let entry_id: Int
    let field1: String
    let field2: String
    let field3: String
    let field4: String
    let field5: String
}

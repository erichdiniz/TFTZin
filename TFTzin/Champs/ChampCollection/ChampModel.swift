// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let champList = try? newJSONDecoder().decode(ChampList.self, from: jsonData)

import Foundation

// MARK: - ChampListElement
struct ChampListElement: Codable {
    let id, name, champListClass: String?
    let origins: [String]?
    let cost: Int?
    let health: [Int]?
    let dps: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case champListClass = "class"
        case origins, cost, health, dps
    }
}

typealias ChampList = [ChampListElement]

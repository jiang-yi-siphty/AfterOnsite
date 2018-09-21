//
//  Flags.swift
//  HelloUber
//
//  Created by Yi JIANG on 21/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation

struct Flags: Codable {
    let sources: [String]
    let nearestStation: Double
    let units: String
    
    enum CodingKeys: String, CodingKey {
        case sources
        case units
        case nearestStation = "nearest-station"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: .sources)
        var sources = [String]()
        while !unkeyedContainer.isAtEnd {
            let source = try unkeyedContainer.decode(String.self)
            sources.append(source)
        }
        self.sources = sources
        units = try container.decode(String.self, forKey: .units)
        nearestStation = try container.decode(Double.self, forKey: .nearestStation)
    }
}

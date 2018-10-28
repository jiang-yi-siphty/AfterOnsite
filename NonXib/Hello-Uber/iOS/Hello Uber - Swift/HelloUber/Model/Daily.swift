//
//  Daily.swift
//  HelloUber
//
//  Created by Yi JIANG on 21/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation

struct Daily: Codable {
    let summary: String?
    let icon: String?
    let data: [DailyForecast?]
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        summary = try container.decode(String.self, forKey: .summary)
        icon = try container.decode(String.self, forKey: .icon)
        var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: .data)
        var data = [DailyForecast]()
        while !unkeyedContainer.isAtEnd {
            let datum = try unkeyedContainer.decode(DailyForecast.self)
            data.append(datum)
        }
        self.data = data
    }
}

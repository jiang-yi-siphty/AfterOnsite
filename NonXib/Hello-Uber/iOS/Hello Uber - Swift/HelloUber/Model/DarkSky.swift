//
//  DarkSky.swift
//  HelloUber
//
//  Created by Yi JIANG on 11/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation

struct DarkSky: Codable {
    
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: Currently
    let daily: Daily
    let flags: Flags
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        timezone = try container.decode(String.self, forKey: .timezone)
        currently = try container.decode(Currently.self, forKey: .currently)
        daily = try container.decode(Daily.self, forKey: .daily)
        flags = try container.decode(Flags.self, forKey: .flags)
    }
    
}


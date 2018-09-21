//
//  CurrentWeather.swift
//  HelloUber
//
//  Created by Yi JIANG on 21/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation

struct Currently: Codable {
    let time: Int32
    let summary: String
    let icon: String
    let temperature: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
    let windGust: Double
    let windBearing: Double
    let cloudCover: Double
    let uvIndex: Int
    let visibility: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Int32.self, forKey: .time)
        summary = try container.decode(String.self, forKey: .summary)
        icon = try container.decode(String.self, forKey: .icon)
        temperature = try container.decode(Double.self, forKey: .temperature)
        humidity = try container.decode(Double.self, forKey: .humidity)
        pressure = try container.decode(Double.self, forKey: .pressure)
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windGust = try container.decode(Double.self, forKey: .windGust)
        windBearing = try container.decode(Double.self, forKey: .windBearing)
        cloudCover = try container.decode(Double.self, forKey: .cloudCover)
        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        visibility = try container.decode(Int.self, forKey: .visibility)
    }
}

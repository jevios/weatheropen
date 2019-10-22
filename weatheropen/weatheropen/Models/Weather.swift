//
//  Weather.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

class Weather: Codable {
    
    // MARK: - Properties
    let detail: Detail
    let name: String
    let weather: [WeatherCondition]
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case detail = "main"
        case name = "name"
        case weather = "weather"
    }
    
    
}

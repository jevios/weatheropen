//
//  Dateil.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

class Detail: Codable {
    
    //MARK: - Properties
    var humidity: Double
    var pressure: Double
    var temperature: Float
    var temperatureMax: Double
    var temperatureMin: Double
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case humidity = "humidity"
        case pressure = "pressure"
        case temperature = "temp"
        case temperatureMax = "temp_max"
        case temperatureMin = "temp_min"
    }
}

//
//  ServiceProvider.swift
//  blueberryone-client-ios
//
//  Created by Boris Sagan on 4/16/19.
//  Copyright © 2019 IT-nity. All rights reserved.
//

import Foundation

final class ServiceProvider {
    
    // MARK: - Singleton
    static let shared = ServiceProvider()
    
    // MARK: - Properties
    var http: HTTPService
    var weather: WeatherService

    private var services: [ServiceInterface] {
        return [http, weather]
    }
    
   // http://api.openweathermap.org/data/2.5/weather
    // MARK: - Initialization
    private init() {
        let environment = Environment("Dev", host: "http://api.openweathermap.org/data", version: "2.5") //FIXME: - HUINYA
        http = HTTPService(environment: environment)
        weather = WeatherService()
        
        for service in services {
            service.initialize()
        }
    }
    
}


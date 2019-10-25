//
//  ServiceProvider.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
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


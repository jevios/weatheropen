//
//  WeatherService.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

class WeatherService: ServiceInterface {
    
    func getWeather(city: String, appID: String, completion handler: @escaping (Result<Weather, GenericError>) -> Void) {
        let request = WeatherRequest.getWeather(city: city, appID: appID)
        ServiceProvider.shared.http.execute(request: request) { (result: Result<Weather, GenericError>) in
            handler(result)
        }
    }
}

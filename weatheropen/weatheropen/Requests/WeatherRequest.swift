//
//  WeatherRequest.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

enum WeatherRequest: HTTPRequest {
    
    case getWeather(city: String, appID: String)
    
    var path: String {
        switch self {
        default:
            return "/weather"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    var query: [String : Any]? {
        switch self {
        case .getWeather(let city, let appID):
            return ["q": city, "appid" : appID]
        default:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var formData: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}

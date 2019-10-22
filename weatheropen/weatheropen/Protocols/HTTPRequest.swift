//
//  HTTPRequest.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

protocol HTTPRequest {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var query: [String: Any]? { get }
    var body: [String: Any]? { get }
    var formData: [String: Any]? { get }
    var headers: [String: Any]? { get }
    
}

enum HTTPMethod: String {
    
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
    
}

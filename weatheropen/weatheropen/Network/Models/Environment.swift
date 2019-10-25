//
//  Environment.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

struct Environment {
    
    // MARK: - Properties
    var name: String
    var host: String
    var version: String
    var headers: [String: Any] = [:]
    var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    // MARK: - Initialization
    init(_ name: String, host: String, version: String) {
        self.name = name
        self.host = host
        self.version = version
    }
    
}

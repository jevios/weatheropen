//
//  HTTPError.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

struct HTTPError: Error, Codable {
    
    // MARK: - Properties
    let message: String
    //let detail: [String: [String]]
    
}

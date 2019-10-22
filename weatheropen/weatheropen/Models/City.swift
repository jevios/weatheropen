//
//  City.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

class City: Codable {
    
    // MARK: - Properties
    var name: String
    
    init(name: String) {
        self.name = name        
    }
    
}

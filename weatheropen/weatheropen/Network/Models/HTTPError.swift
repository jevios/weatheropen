//
//  HTTPError.swift
//  blueberryone-client-ios
//
//  Created by Boris Sagan on 4/16/19.
//  Copyright © 2019 IT-nity. All rights reserved.
//

import Foundation

struct HTTPError: Error, Codable {
    
    // MARK: - Properties
    let message: String
    //let detail: [String: [String]]
    
}

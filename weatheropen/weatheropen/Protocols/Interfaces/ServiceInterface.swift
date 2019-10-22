//
//  ServiceInterface.swift
//  blueberryone-client-ios
//
//  Created by Boris Sagan on 4/16/19.
//  Copyright © 2019 IT-nity. All rights reserved.
//

import Foundation

protocol ServiceInterface: class {
    
    func initialize()
    func reset()
    
}

extension ServiceInterface {
    
    func initialize() { }
    
    func reset() { }
    
}

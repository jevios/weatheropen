//
//  ServiceInterface.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
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

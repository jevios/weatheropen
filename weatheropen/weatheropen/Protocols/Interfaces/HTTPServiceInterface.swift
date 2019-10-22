//
//  HTTPServiceInterface.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

protocol HTTPServiceInterface: class {
    
    init(environment: Environment)
    func execute<T: Codable>(request: HTTPRequest, completion handler: @escaping (Result<T, GenericError>) -> Void)
    
}

//
//  ErrorHandler.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

class ErrorHandler {
    
    enum HTTPErrorCode: Int {
        case badRequest = 400
        case unauthorized = 401
        case forbidden = 403
        case notFound = 404
        case methodNotAllowed = 405
        
        case internalServerError = 500
        case notImplemented = 501
    }
    
    func handleError(code: Int, data: Data?) -> GenericError {
        let genericError = GenericError(message: "Something went wrong")
        guard let type = HTTPErrorCode(rawValue: code) else { return genericError }
        
        switch type {
        case .badRequest:
            guard let data = data else { return genericError }
            let decoder = JSONDecoder()
            do {
                let httpError = try decoder.decode(HTTPError.self, from: data)
                return GenericError(message: httpError.message)
            } catch {
                print("[ErrorHandler] Error pasring failed. Error - \(error)")
                return genericError
            }
        case .unauthorized:
            return GenericError(message: "Not Authorized")
        case .forbidden:
            return GenericError(message: "Forbidden")
        case .notFound:
            return GenericError(message: "Not Found")
        case .methodNotAllowed:
            return GenericError(message: "Method Not Allowed")
        case .internalServerError:
            return GenericError(message: "Internal Server Error")
        case .notImplemented:
            return GenericError(message: "Not implemented")
        }
    }
    
}

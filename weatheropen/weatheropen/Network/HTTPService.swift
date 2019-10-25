//
//  HTTPService.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import Foundation

final class HTTPService: ServiceInterface {
    
    // MARK: - Errors
    enum HTTPServiceError: Error {
        case preparingURLRequestError
    }
    
    // MARK: - Properties
    private var environment: Environment
    private var session: URLSession
    var baseUrl: String {
        return environment.host + "/\(environment.version)"
    }
    
    // MARK: - Initialization
    required init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
}

// MARK: - HTTPServiceInterface
extension HTTPService: HTTPServiceInterface {
    
    func execute<T>(request: HTTPRequest, completion handler: @escaping (Result<T, GenericError>) -> Void) where T : Decodable, T : Encodable {
        let rq = try! prepareURLRequest(for: request)
        let dataTask = session.dataTask(with: rq, completionHandler: { (data, urlResponse, error) in
            guard let data = data else {
                // TODO: Handle this case
                return
            }
            
            let httpUrlResponse = urlResponse as! HTTPURLResponse
            let statusCode = httpUrlResponse.statusCode
            
            switch statusCode {
            case 204:
                if data.isEmpty {
                    let emptyResponse = try! JSONDecoder().decode(EmptyResponse.self, from: "{}".data(using: .utf8)!)
                    return handler(.success(emptyResponse as! T))
                } else {
                    fallthrough
                }
            case 200...299:
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: data)
                    return handler(.success(response))
                } catch {
                    print("[HTTPService] Response parsing failed. Error - \(error)")
                    print("[HTTPService] JSON: \(String(describing: try? JSONSerialization.jsonObject(with: data, options: [])))")
                    return handler(.failure(GenericError(message: "Parsing response error")))
                }
            case 400...499:
                return handler(.failure(ErrorHandler().handleError(code: statusCode, data: data)))
            case 500...599:
                return handler(.failure(ErrorHandler().handleError(code: statusCode, data: nil)))
            default:
                handler(.failure(GenericError(message: "[HTTPService] Unknown error")))
            }
        })
        
        dataTask.resume()
    }
    
    private func prepareURLRequest(for request: HTTPRequest) throws -> URLRequest {
        let fullUrl = "\(baseUrl)\(request.path)"
        var urlRequest = URLRequest(url: URL(string: fullUrl)!)
        
        if let query = request.query {
            guard let query = query as? [String: String] else {
                throw HTTPServiceError.preparingURLRequestError
            }
            
            let queryItems = query.map({ (element) -> URLQueryItem in
                return URLQueryItem(name: element.key, value: element.value)
            })
            
            guard var components = URLComponents(string: fullUrl) else {
                throw HTTPServiceError.preparingURLRequestError
            }
            
            components.queryItems = queryItems
            urlRequest.url = components.url
        }
        
        if let body = request.body {
            urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        if let formData = request.formData {
            let boundary = generateBoundary()
            urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            let dataBody = generateBody(withParameters: formData, boundary: boundary)
            urlRequest.httpBody = dataBody
        }
        
        environment.headers.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        urlRequest.httpMethod = request.method.rawValue
        
//        if let token = ServiceProvider.shared.user.token {
//            urlRequest.addValue(token, forHTTPHeaderField: "Authorization")
     //   }
        
        return urlRequest
    }
    
    private func generateBody(withParameters params: [String: Any]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                if value is Data {
                    let filename = "avatar.jpeg" // FIXME: Hardcoded
                    let mimetype = "image/jpeg"
                    body.append("--\(boundary + lineBreak)")
                    body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\(lineBreak)")
                    body.append("Content-Type: \(mimetype + lineBreak + lineBreak)")
                    body.append(value as! Data)
                    body.append(lineBreak)
                } else {
                    body.append("--\(boundary + lineBreak)")
                    body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                    body.append("\(String(describing: value) + lineBreak)")
                }
            }
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
    
    private func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    private enum HTTPErrorType {
        case emptyData
        case nullResponse
        case statusCode(code: Int, data: Data?)
        case loggedOut
        case invalidContentType(type: String, data: Data)
        case jsonDecodeError(error: Error)
    }
    
    
}

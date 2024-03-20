//
//  EndPoint.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import Foundation
enum Endpoint {
    case login(url: String = "/api/login",login: loginBody)
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValues(for: self)
        return request
    }
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .login(let url,_):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        default: return []
        }
    }
    
    
    private var httpMethod: String {
        switch self {
        case .login:
            return HTTP.Method.post.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .login(_, let login):
            let jsonPost = try? JSONEncoder().encode(login)
            return jsonPost
        }
    }
}
extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .login:
            self.setValue(
                HTTP.Headers.Value.applicationJson.rawValue,
                forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue
            )
        }
    }
}


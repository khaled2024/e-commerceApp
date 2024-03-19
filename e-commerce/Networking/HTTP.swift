//
//  HTTP.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import Foundation

enum HTTP {
    // Methods
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
    }
    // Headers
    enum Headers {
        enum Key: String {
            case contentType = "content-type"
            case accept = "Accept"
            case Authorization = "Authorization"
        }
        enum Value: String{
            case applicationJson = "application/json"
        }
    }
}

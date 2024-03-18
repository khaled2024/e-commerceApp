//
//  HTTP.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import Foundation

enum HTTP {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        enum Key: String {
            case contentType = "content-type"
        }
        enum value: String{
            case applicationJson = "application/json"
        }
    }
    
    
 
}

//
//  LoginModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import Foundation
// MARK: - LoginData
struct LoginData: Codable {
    let status: String
    let error: Int
    let message: String
    let data: LoginModel?
}

// MARK: - LoginModel
struct LoginModel: Codable {
    let id: Int
    let address: String?
    let name, phone, type: String
    let status, createdAt, updatedAt : String
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, phone, address, type, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case token
    }
}
struct LoginError: Codable{
    let status: String
    let error: Int
    let message: String
}


struct loginBody: Codable{
    let phone: String
    let password: String
}

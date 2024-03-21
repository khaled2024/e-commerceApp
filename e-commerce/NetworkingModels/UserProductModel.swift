//
//  UserFavouriteProductModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 21/03/2024.
//

import Foundation

// MARK: - UserFavouriteProductModel
struct UserProductModel: Codable {
    let status: String
    let error: Int
    let message: String
    let data: [ProductData]
}

// MARK: - Datum
struct ProductData: Codable {
    let id: Int
    let name, description: String
    let images: Images
    let price: Int
    let smallSize, mediumSize, largeSize: String
    let discount: Int
    let status, createdAt, updatedAt: String
    let marketID: Int
    let marketName: String
    
    
    enum CodingKeys: String, CodingKey {
            case id, name, description, images, price
            case smallSize = "small_size"
            case mediumSize = "medium_size"
            case largeSize = "large_size"
            case discount, status
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case marketID = "market_id"
            case marketName = "market_name"
        }
}

// MARK: - Images
struct Images: Codable {
    let id: Int
    let image: String
    let productID: Int
    
    enum CodingKeys: String, CodingKey {
        case id, image
        case productID = "product_id"
    }
}


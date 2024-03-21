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
    let images: Images?
    let price: Int?
    let smallSize, mediumSize, largeSize: String?
    let discount: Int?
    let status, createdAt, updatedAt: String?
    let marketID: Int?
    let marketName: String?
}

// MARK: - Images
struct Images: Codable {
    let id: Int?
    let image: String?
    let productID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, image
        case productID
    }
}


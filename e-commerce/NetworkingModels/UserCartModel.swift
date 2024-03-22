//
//  UserCartModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 22/03/2024.
//

import Foundation

// MARK: - UserFavouriteProductModel
struct UserCartModel: Codable {
    let status: String
    let error: Int
    let message: String
    let data: [UserCartData]
}

// MARK: - Datum
struct UserCartData: Codable {
    let cartID: Int
    let product: CartProduct
    let totalPrice: Int

    enum CodingKeys: String, CodingKey {
        case cartID = "cart_id"
        case product
        case totalPrice = "total_price"
    }
}

// MARK: - Product
struct CartProduct: Codable {
    let id: Int
    let name: String
    let price: Int
    let image: Image
    let extra: [Extra]
    let quantity: Int
    let size: String
    let marketID: Int
    let nameMarket, typeMarket, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, price, image, extra, quantity, size
        case marketID = "market_id"
        case nameMarket = "name_market"
        case typeMarket = "type_market"
        case createdAt = "created_at"
    }
}

// MARK: - Extra
struct Extra: Codable {
    let id: Int
    let nameExtra: String
    let image: String
    let priceExtra: Int
    let statusExtra: String

    enum CodingKeys: String, CodingKey {
        case id
        case nameExtra = "name_extra"
        case image
        case priceExtra = "price_extra"
        case statusExtra = "status_extra"
    }
}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let image: String
    let productID: Int

    enum CodingKeys: String, CodingKey {
        case id, image
        case productID = "product_id"
    }
}

//
//  UserOrderModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/03/2024.
//


import Foundation

struct UserOrderModel: Codable {
    let status: String
    let error: Int
    let message: String
    let data: [UserOrderData]
}

// MARK: - Datum
struct UserOrderData: Codable {
    let id: Int
    let cart: [OrderCart]
    let status, paymentMethod, lat, lng: String
    let address: String

    enum CodingKeys: String, CodingKey {
        case id, cart, status
        case paymentMethod = "payment_method"
        case lat, lng, address
    }
}

// MARK: - Cart
struct OrderCart: Codable {
    let cartID: Int
    let product: OrderProduct
    let totalPrice: String?

    enum CodingKeys: String, CodingKey {
        case cartID = "cart_id"
        case product
        case totalPrice = "total_price"
    }
}

// MARK: - Product
struct OrderProduct: Codable {
    let id: Int
    let name: String
    let price: Int
    let image: OrderImage
    let extra: [OrderExtra]
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
struct OrderExtra: Codable {
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
struct OrderImage: Codable {
    let id: Int
    let image: String
    let productID: Int

    enum CodingKeys: String, CodingKey {
        case id, image
        case productID = "product_id"
    }
}

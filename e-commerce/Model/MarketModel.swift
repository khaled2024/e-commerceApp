//
//  MarketModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit
// Markets
struct MarketModel {
    let image: UIImage
    let marketName: String
    let marketCategory: String
    let available: Expirable
}
enum Expirable: String {
    case Expired = "Expired"
    case NonExpired = "May 12,2024"
}
let markets = [
    MarketModel(image: UIImage(named: "burger2")!, marketName: "Burger", marketCategory:"Food Market", available: .Expired),
    MarketModel(image: UIImage(named: "desertImage")!, marketName: "cake", marketCategory:"Desert Market", available: .Expired),
    MarketModel(image: UIImage(named: "CofeeImage")!, marketName: "Coffee", marketCategory:"Coffee Market", available: .NonExpired),
    MarketModel(image: UIImage(named: "VegetablesImage")!, marketName: "tomatos", marketCategory:"Vegetables Market", available: .NonExpired),
    MarketModel(image: UIImage(named: "fruitsImage")!, marketName: "Apples", marketCategory:"Fruits Market", available: .Expired),
    MarketModel(image: UIImage(named: "burger2")!, marketName: "Burger", marketCategory:"Desert Market", available: .Expired),
    MarketModel(image: UIImage(named: "burger2")!, marketName: "Burger", marketCategory:"desert Market", available: .NonExpired),
    MarketModel(image: UIImage(named: "burger2")!, marketName: "Burger", marketCategory:"Food Market", available: .Expired),
    MarketModel(image: UIImage(named: "burger2")!, marketName: "Burger", marketCategory:"Food Market", available: .Expired),
    MarketModel(image: UIImage(named: "desertImage")!, marketName: "cake", marketCategory:"Desert Market", available: .Expired),
    MarketModel(image: UIImage(named: "CofeeImage")!, marketName: "Coffee", marketCategory:"Coffee Market", available: .NonExpired),
    MarketModel(image: UIImage(named: "VegetablesImage")!, marketName: "tomatos", marketCategory:"Vegetables Market", available: .NonExpired),
    MarketModel(image: UIImage(named: "fruitsImage")!, marketName: "Apples", marketCategory:"Fruits Market", available: .Expired),
    
]

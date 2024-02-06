//
//  BannerModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/01/2024.
//

import UIKit
// BannerModel
struct BannerModel {
    let image: String
}
// CategoryModel
struct CategoryModel {
    let image: String
    let name: String
}
// RestaurantModel
struct RestaurantModel {
    let image: String
    let name: String
    let state: State
    
}
enum State: String{
    case open = "open"
    case close = "close"
}
// best products
struct Product {
    let image: String
    let productName: String
    let resturantName: String
    let price: String
}
// favouite product
struct Favourite {
    let image: UIImage
    let productName: String
    let available: Available
}
enum Available: String {
    case Exist = "Exist"
    case Expired = "Expired"
}

let bannerImages =
[
    BannerModel(image:  "food-social-media-banner")
    ,BannerModel(image: "food-social-media-banner")
    ,BannerModel(image: "food-social-media-banner")
    ,BannerModel(image: "food-social-media-banner")
    ,BannerModel(image: "food-social-media-banner")
]
let categories =
[
    CategoryModel(image: "pizza-image", name: "pizza"),
    CategoryModel(image: "chicken-image", name: "Chicken"),
    CategoryModel(image: "fruits-image", name: "Fruits"),
    CategoryModel(image: "Burger-image", name: "Burger"),
    CategoryModel(image: "Vegetable-image", name: "Vegetable"),
    CategoryModel(image: "pizza-image", name: "pizza"),
    CategoryModel(image: "chicken-image", name: "Chicken")
]
let restaurants =
[
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close)
]


let bestProducts =
[
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-kebab", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Hurger", resturantName: "Burger king", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-kebab", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Hurger", resturantName: "Burger king", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-kebab", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Hurger", resturantName: "Burger king", price: "15.00")
    
]
let bestResturants =
[
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close),
    RestaurantModel(image: "resturant-pizza", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-kebab", name: "Pizza house",state: .open),
    RestaurantModel(image: "resturant-Burger", name: "Pizza house",state: .close)
    
]
let bestBurgers =
[
    Product(image: "resturant-Burger", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Burger", resturantName: "Burger king", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-kebab", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Hurger", resturantName: "Burger king", price: "15.00")
    
]

let bestPizza = [
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Burger", resturantName: "Burger king", price: "15.00"),
    Product(image: "resturant-pizza", productName: "Pizza Hut", resturantName: "Pizza Home", price: "15.00"),
    Product(image: "resturant-kebab", productName: "Kebab", resturantName: "Kebab Mahal", price: "15.00"),
    Product(image: "resturant-Burger", productName: "Hurger", resturantName: "Burger king", price: "15.00")
]
let favouriteProducts = [
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Exist),
    Favourite(image: UIImage(named: "pizza2")!, productName: "Pizza", available: .Exist),
    Favourite(image: UIImage(named: "pizza2")!, productName: "Pizza", available: .Expired),
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Exist),
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Expired),
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Exist),
    Favourite(image: UIImage(named: "pizza2")!, productName: "Pizza", available: .Exist),
    Favourite(image: UIImage(named: "pizza2")!, productName: "Pizza", available: .Expired),
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Exist),
    Favourite(image: UIImage(named: "burger2")!, productName: "Burger", available: .Expired)
]

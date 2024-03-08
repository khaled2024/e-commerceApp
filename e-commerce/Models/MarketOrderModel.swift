//
//  MarketOrderModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 08/03/2024.
//

import UIKit
enum PayMethods: String {
    case Visa = "Visa"
    case cash = "Cash"
    case masterCard = "Master Card"
}



struct MarketOrderModel {
    let id: String
    let name: String
    let pay: PayMethods
    let driverID: Int
    var date: String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/MM"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    var time: String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeStyle = .short
        let timeString = dateFormatter.string(from: currentDate)
        return timeString
    }
    let meals: String
}


let marketOrders:[MarketOrderModel] = [
    .init(id: "01", name: "Khaled", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "02", name: "hussien", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "04", name: "ahmed", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "05", name: "Khaled", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "09", name: "mohammed", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "12", name: "khalifa", pay: .Visa, driverID: 30, meals: "Burger"),
    .init(id: "45", name: "Khaled", pay: .Visa, driverID: 30, meals: "Burger"),
]

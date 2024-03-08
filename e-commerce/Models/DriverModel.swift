//
//  DriverModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/02/2024.
//

import UIKit
let date = Date()

enum License: String {
    case Expired
    case NonExpired
}
enum Status: String {
    case Online
    case Offline
}


struct DriverModel{
    let driverImage: UIImage
    let driverName: String
    let driverLicense: License
    let marketDriverStatus: Status
}

let allDrivers: [DriverModel] = [
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "Khaled", driverLicense: .Expired, marketDriverStatus: .Online),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "hussien", driverLicense: .NonExpired, marketDriverStatus: .Offline),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "Khaled", driverLicense: .Expired, marketDriverStatus: .Offline),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "Khaled", driverLicense: .Expired, marketDriverStatus: .Online),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "hussien", driverLicense: .NonExpired, marketDriverStatus: .Online),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "Khaled", driverLicense: .Expired, marketDriverStatus: .Online),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "hussien", driverLicense: .NonExpired, marketDriverStatus: .Offline),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "hussien", driverLicense: .NonExpired, marketDriverStatus: .Offline),
]

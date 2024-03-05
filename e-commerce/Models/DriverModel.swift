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
struct DriverModel{
    let driverImage: UIImage
    let driverName: String
    let driverLicense: License
}

let allDrivers: [DriverModel] = [
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "Khaled", driverLicense: .Expired),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "hussien", driverLicense: .NonExpired),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "Khaled", driverLicense: .Expired),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "Khaled", driverLicense: .Expired),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "hussien", driverLicense: .NonExpired),
    .init(driverImage: UIImage(named: "driverImage")!, driverName: "Khaled", driverLicense: .Expired),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "hussien", driverLicense: .NonExpired),
    .init(driverImage: UIImage(named: "driverImage2")!, driverName: "hussien", driverLicense: .NonExpired),
    


]

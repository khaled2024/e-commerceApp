//
//  CostumerModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import Foundation
struct CostumerModel {
    let name: String
    let message: String
    let time: String
    let costumerImage: String
}
let costumers: [CostumerModel] = [
    .init(name: "khaled", message: "my name is khaled, hello there", time: "2:30", costumerImage: "sadPerson"),
    .init(name: "Hussien", message: "my name is Hussien, hello there", time: "2:30", costumerImage: "delivaruGuy"),
    .init(name: "khalifa", message: "my name is khalifa, hello there", time: "5:30", costumerImage: "sadPerson"),
    .init(name: "khaled", message: "my name is khaled, hello there", time: "2:30", costumerImage: "delivaruGuy"),
    .init(name: "khaled", message: "my name is khaled, hello there", time: "2:30", costumerImage: "delivaruGuy"),
    .init(name: "Hussien", message: "my name is Hussien, hello there", time: "2:30", costumerImage: "sadPerson"),
    .init(name: "khalifa", message: "my name is khalifa, hello there", time: "5:30", costumerImage: "sadPerson"),
    .init(name: "khaled", message: "my name is khaled, hello there", time: "2:30", costumerImage: "delivaruGuy")
]

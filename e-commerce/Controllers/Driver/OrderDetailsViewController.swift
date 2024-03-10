//
//  OrderDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 11/03/2024.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    var driverOrder: DriverOrderModel? = nil
    static let identifier = String(describing: OrderDetailsViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        if let driverOrder = self.driverOrder{
            print(driverOrder)
        }
        
    }
}

//
//  DriverTabBar.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 10/03/2024.
//

import UIKit

class DriverTabBar: UITabBarController {

    @IBOutlet weak var driverTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        driverTabBar.setUpLayers()

    }
    


}

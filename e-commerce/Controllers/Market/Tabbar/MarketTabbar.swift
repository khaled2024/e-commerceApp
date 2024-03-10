//
//  MarketTabbar.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketTabbar: UITabBarController {

    @IBOutlet weak var marketTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        marketTabbar.setUpLayers()

    }
    


}

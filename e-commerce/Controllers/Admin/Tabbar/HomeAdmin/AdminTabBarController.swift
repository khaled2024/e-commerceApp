//
//  AdminTabBarController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class AdminTabBarController: UITabBarController {

    @IBOutlet weak var adminTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        adminTabbar.setUpLayers()
        
    }
    
    

}

//
//  MainTabBarController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    static let identifier = String(describing: MainViewController.self)
    @IBOutlet weak var userMainTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    func setUpDesign(){
        userMainTabbar.setUpLayers()
        self.tabBar.tintColor = .systemOrange
        self.tabBar.unselectedItemTintColor = .darkGray
        self.delegate = self
    }
    
    
}
// UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 1{
            print("Selected \(self.selectedIndex)")
        }
    }
}
